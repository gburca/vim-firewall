# Vim ULOG/NFLOG firewall Syntax/FTDetect

This is a vim syntax file for Linux ULOG/NFLOG firewall log files.

The `filetype` will be set to `firewall` for /var/log/ulog/syslogemu files or
if the first file line is similar to the example below.

A typical log entry is expected to look like this:

`Dec 27 14:49:54 incipit Shorewall:net2fw:DROP: IN=eth0 OUT= MAC=6d:f0:49:ed:21:61:00:01:5c:67:3a:46:08:08 SRC=278.77.78.38 DST=37.213.12.213 LEN=40 TOS=00 PREC=0x20 TTL=236 ID=54321 PROTO=TCP SPT=35978 DPT=8081 SEQ=3019911776 ACK=0 WINDOW=65535 SYN URGP=0 MARK=0`

See a before/after sample at: http://ebixio.com/blog/2016/01/06/vim-syntax-highlighting-for-firewall-logs/
