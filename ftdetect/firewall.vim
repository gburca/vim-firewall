" Vim ftdetect file
" Language:     Linux firewall log file (ULOG/NFLOG) (ex: /var/log/ulog/syslogemu.log)
" Maintainer:   Gabriel Burca <gburca dash vim at ebixio dot com>
" Last Change:  2015 Dec 28

" Don't do these checks if the filetype is already set
if did_filetype()
	finish
endif

autocmd BufRead,BufNewFile /var/log/ulog/syslogemu* set filetype=firewall
" Example log line:
" Dec 27 14:49:54 incipit Shorewall:net2fw:DROP: IN=eth0 OUT= MAC=6d:f0:49:ed:21:61:00:01:5c:67:3a:46:08:08 SRC=278.77.78.38 DST=37.213.12.213 LEN=40 TOS=00 PREC=0x20 TTL=236 ID=54321 PROTO=TCP SPT=35978 DPT=8081 SEQ=3019911776 ACK=0 WINDOW=65535 SYN URGP=0 MARK=0 
autocmd BufRead,BufNewFile * :if getline(1) =~ 'IN=.* OUT=.* MAC=.* SRC=.* DST=.* SPT=.* DPT=.*'| setfiletype firewall | endif
