#!/bin/sed -f

# http status code
s/\(HTTP\/1..\"\) \(2[0-9][0-9]\) /\1 \x1b[0;34m\2\x1b[0m /
s/\(HTTP\/1..\"\) \(3[0-9][0-9]\) /\1 \x1b[0;32m\2\x1b[0m /
s/\(HTTP\/1..\"\) \(4[0-9][0-9]\) /\1 \x1b[0;33m\2\x1b[0m /
s/\(HTTP\/1..\"\) \(5[0-9][0-9]\) /\1 \x1b[0;31m\2\x1b[0m /

# ip address
s/\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)/\x1b[0;36m\1\x1b[0m/

# php
s@\([^/?]*\)\(\.php\)@\x1b[0;36m\1\x1b[0m\2@
# py
s@\([^/?]*\)\(\.py\)@\x1b[0;36m\1\x1b[0m\2@
s/\(line\) \([0-9]\+\)/\x1b[0;31m\1 \2\x1b[0m/
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
