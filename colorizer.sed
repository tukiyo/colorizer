#!/bin/sed -f

# http status code
s/\(HTTP\/1..\"\) \(2[0-9][0-9]\) /\1 {{blue}}\2{{reset}} /
s/\(HTTP\/1..\"\) \(3[0-9][0-9]\) /\1 {{green}}\2{{reset}} /
s/\(HTTP\/1..\"\) \(4[0-9][0-9]\) /\1 {{yellow}}\2{{reset}} /
s/\(HTTP\/1..\"\) \(5[0-9][0-9]\) /\1 {{red}}\2{{reset}} /

# ip address
s/\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)/{{cyan}}\1{{reset}}/g

# symbols
s@\([()\@=,'":<>&*?~]\)@{{cyan}}\1{{reset}}@g
# date-time
s/^\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\)/{{cyan}}\1{{reset}}/
s/ \([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\)/ {{cyan}}\1{{reset}}/

# php
s@\([^/?]*\)\(\.php\)@{{cyan}}\1{{reset}}\2@
s/\(does not exist.*\)\(favicon.ico\)/\1{{blue}}\2{{reset}}/

# py
s@\([^/?]*\)\(\.py\)@{{cyan}}\1{{reset}}\2@
s/\([Ll]ine\) \([0-9]\+\)/{{red}}\1 \2{{reset}}/
s/ \(INFO\) / {{blue}}\1{{reset}} /
s/ \(WARNING\) / {{green}}\1{{reset}} /
s/\(ERROR\)/{{yellow}}\1{{reset}}/i
s/ \(DEBUG\) / {{red}}\1{{reset}} /
s@\(File\)@{{magenta}}\1{{reset}}@
s@\([Tt]raceback\)@{{magenta}}\1{{reset}}@
s@\(dist-packages\)@{{magenta}}\1{{reset}}@
s@ \(no\|in\) @ {{magenta}}\1{{reset}} @g

# sql
s/\(BEGIN\|SELECT\|FROM\|WHERE\|LIMIT\|AS\|CREATE\) /{{magenta}}\1{{reset}} /ig
s/\(DELETE\) /{{red}}\1{{reset}} /ig

# command args
s@\([\^\[\ \t]\)\(-\+\w\+\)@\1{{cyan}}\2{{reset}}@g

# example
s@\/\(admin\)/@/{{red}}\1{{reset}}/@

# replace variable colors
s@{{red}}@\x1b[0;31m@g
s@{{green}}@\x1b[0;32m@g
s@{{yellow}}@\x1b[0;33m@g
s@{{blue}}@\x1b[0;34m@g
s@{{magenta}}@\x1b[0;35m@g
s@{{cyan}}@\x1b[0;36m@g

s@{{RED}}@\x1b[1;31m@g
s@{{GREEN}}@\x1b[1;32m@g
s@{{YELLOW}}@\x1b[1;33m@g
s@{{BLUE}}@\x1b[1;34m@g
s@{{MAGENTA}}@\x1b[1;35m@g
s@{{CYAN}}@\x1b[1;36m@g

s@{{reset}}@\x1b[0m@g

## style
# reset     [0m  
# bold      [1m  
# italic    [3m  
# underline [4m  
# blink     [5m  

## colors
# red     [31m  [0;31m  [1;31m
# green   [32m  [0;32m  [1;32m
# yellow  [33m  [0;33m  [1;33m
# blue    [34m  [0;34m  [1;34m
# magenta [35m  [0;35m  [1;35m
# cyan    [36m  [0;36m  [1;36m
