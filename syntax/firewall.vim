" Vim syntax file
" Language:     Linux firewall log file (ULOG/NFLOG) (ex: /var/log/ulog/syslogemu.log)
" Maintainer:   Gabriel Burca <gburca dash vim at ebixio dot com>
" Last Change:  2015 Dec 28

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match   fwBegin       display '^' nextgroup=fwDate,fwDateRFC3339

syn match   fwDate        contained display '\a\a\a [ 0-9]\d *'
                                \ nextgroup=fwHour

syn match   fwHour        contained display '\d\d:\d\d:\d\d\s*'
                                \ nextgroup=fwHost

syn match   fwDateRFC3339 contained display '\d\{4}-\d\d-\d\d'
                                \ nextgroup=fwRFC3339T

syn match   fwRFC3339T    contained display '\cT'
                                \ nextgroup=fwHourRFC3339

syn match   fwHourRFC3339 contained display '\c\d\d:\d\d:\d\d\(\.\d\+\)\=\([+-]\d\d:\d\d\|Z\)'
                                \ nextgroup=fwHost

syn match   fwHost        contained display '\S*\s*'
                                \ nextgroup=fwRule

" Packet disposition
syn match   fwDisposition contained '\(ACCEPT\|DROP\|REJECT\|CONTINUE\|QUEUE\|NFQUEUE\)' containedin=fwRule
" Firewall chain
" EXAMPLE:
"   Shorewall:net2fw:DROP:
"             ^^^^^^
syn match   fwChain       contained ':[^: ]\+:'hs=s+1,he=e-1                             containedin=fwRule
" EXAMPLE:
"   Shorewall:net2fw:DROP:
syn match   fwRule        contained display '\s*[^:]\+:[^:]\+:[^:]*:\s\+'
                                \ nextgroup=fwIn contains=fwChain,fwDisposition
" IN interface.
syn match   fwIn          contained display 'IN=\S*\s\+'he=e-1
                                \ nextgroup=fwOut
" OUT interface (could be empty).
" EXAMPLE:
"   OUT=eth0
"   OUT=
syn match   fwOut         contained display 'OUT=\S*\s\+'he=e-1
                                \ nextgroup=fwMAC
" MAC address (could be empty).
" EXAMPLE:
"   MAC=6c:f0:49:ed:21:61:00:01:5c:67:0a:46:08:00
"   MAC=
syn match   fwMAC         contained display 'MAC=\S*\s\+'he=e-1
                                \ nextgroup=fwSrc
" IP address
syn match   fwIP          '\d\+\.\d\+\.\d\+\.\d\+'
" Source IP
syn match   fwSrc         contained display 'SRC=\S\+\s\+'he=e-1
                                \ nextgroup=fwDst contains=fwIP
" Destination IP
syn match   fwDst         contained display 'DST=\S\+\s\+'he=e-1
                                \ nextgroup=fwText contains=fwIP
" Source port
syn match   fwSpt         contained display 'SPT=\S\+\s\+'he=e-1
                                \ nextgroup=fwDpt contains=fwNumber
" Destination port
syn match   fwDpt         contained display 'DPT=\S\+\s\+'he=e-1
                                \ contains=fwNumber

syn match   fwText        contained display '.*'
                                \ contains=fwSpt,fwDpt

syn match   fwNumber      contained '0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*'

hi def link fwDate        Constant
hi def link fwHour        Type
hi def link fwDateRFC3339 Constant
hi def link fwHourRFC3339 Type
hi def link fwRFC3339T    Normal
hi def link fwHost        Identifier
hi def link fwIn          Identifier
hi def link fwOut         Identifier
hi def link fwRule        Normal
hi def link fwChain       Operator
hi def link fwPID         Constant
hi def link fwSrc         Special
hi def link fwDst         Special
hi def link fwSpt         Underlined
hi def link fwDpt         Underlined
hi def link fwDisposition ErrorMsg
hi def link fwIP          Constant
"hi def link fwMAC         Underlined
hi def link fwText        Normal
hi def link fwNumber      Number

let b:current_syntax = "firewall"

let &cpo = s:cpo_save
unlet s:cpo_save
