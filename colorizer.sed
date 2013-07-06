#!/bin/sed -f

# http status code
s/\(HTTP\/1..\"\) \(2[0-9][0-9]\) /\1 \x1b[0;34m\2\x1b[0m /
s/\(HTTP\/1..\"\) \(3[0-9][0-9]\) /\1 \x1b[0;32m\2\x1b[0m /
s/\(HTTP\/1..\"\) \(4[0-9][0-9]\) /\1 \x1b[0;33m\2\x1b[0m /
s/\(HTTP\/1..\"\) \(5[0-9][0-9]\) /\1 \x1b[0;31m\2\x1b[0m /

# ip address
s/\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)/\x1b[0;36m\1\x1b[0m/g

# symbols
s@\([()\@=,'":<>&*?~]\)@\x1b[0;36m\1\x1b[0m@g
# date-time
s/^\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\)/\x1b[0;36m\1\x1b[0m/

# php
s@\([^/?]*\)\(\.php\)@\x1b[0;36m\1\x1b[0m\2@
s/\(does not exist.*\)\(favicon.ico\)/\1\x1b[0;34m\2\x1b[0m/

# py
s@\([^/?]*\)\(\.py\)@\x1b[0;36m\1\x1b[0m\2@
s/\([Ll]ine\) \([0-9]\+\)/\x1b[0;31m\1 \2\x1b[0m/
s/ \(INFO\) / \x1b[0;34m\1\x1b[0m /
s/ \(WARNING\) / \x1b[0;32m\1\x1b[0m /
s/\(ERROR\)/\x1b[0;33m\1\x1b[0m/i
s/ \(DEBUG\) / \x1b[0;31m\1\x1b[0m /
s@\(File\)@\x1b[0;35m\1\x1b[0m@
s@\([Tt]raceback\)@\x1b[0;35m\1\x1b[0m@
s@\(dist-packages\)@\x1b[0;35m\1\x1b[0m@
s@ \(no\|in\) @ \x1b[1;35m\1\x1b[0m @g

# sql
s/\(BEGIN\|SELECT\|FROM\|WHERE\|LIMIT\|AS\) /\x1b[0;35m\1\x1b[0m /g
s/\(DELETE\) / \x1b[0;31m\1\x1b[0m /ig

# command args
s@\([\^\[\ \t]\)\(-\+\w\+\)@\1\x1b[0;35m\2\x1b[0m@g

# example
s@\/\(admin\)/@/\x1b[0;31m\1\x1b[0m/@


## colors
# reset     [0m  
# bold      [1m  
# italic    [3m  
# underline [4m  
# blink     [5m  

# black   [30m  [0;30m  [1;30m
# red     [31m  [0;31m  [1;31m
# green   [32m  [0;32m  [1;32m
# yellow  [33m  [0;33m  [1;33m
# blue    [34m  [0;34m  [1;34m
# magenta [35m  [0;35m  [1;35m
# cyan    [36m  [0;36m  [1;36m
# white   [37m  [0;37m  [1;37m
