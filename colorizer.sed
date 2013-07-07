#!/bin/sed -f

# http status code
s/\(HTTP\/1..\"\) \(2[0-9][0-9]\) /\1 {{BLUE}}\2{{RESET}} /
s/\(HTTP\/1..\"\) \(3[0-9][0-9]\) /\1 {{GREEN}}\2{{RESET}} /
s/\(HTTP\/1..\"\) \(4[0-9][0-9]\) /\1 {{YELLOW}}\2{{RESET}} /
s/\(HTTP\/1..\"\) \(5[0-9][0-9]\) /\1 {{RED}}\2{{RESET}} /

# ip address
s/\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)/{{CYAN}}\1{{RESET}}/g

# symbols
s@\([()\@=,'":<>&*?~]\)@{{CYAN}}\1{{RESET}}@g
# date-time
s/^\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\)/{{CYAN}}\1{{RESET}}/
s/ \([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\)/ {{CYAN}}\1{{RESET}}/

# php
s@\([^/?]*\)\(\.php\)@{{CYAN}}\1{{RESET}}\2@
s/\(does not exist.*\)\(favicon.ico\)/\1{{BLUE}}\2{{RESET}}/

# py
s@\([^/?]*\)\(\.py\)@{{CYAN}}\1{{RESET}}\2@
s/\([Ll]ine\) \([0-9]\+\)/{{RED}}\1 \2{{RESET}}/
s/ \(INFO\) / {{BLUE}}\1{{RESET}} /
s/ \(WARNING\) / {{GREEN}}\1{{RESET}} /
s/\(ERROR\)/{{YELLOW}}\1{{RESET}}/i
s/ \(DEBUG\) / {{RED}}\1{{RESET}} /
s@\(File\)@{{MAGENTA}}\1{{RESET}}@
s@\([Tt]raceback\)@{{MAGENTA}}\1{{RESET}}@
s@\(dist-packages\)@{{MAGENTA}}\1{{RESET}}@
s@ \(no\|in\) @ {{MAGENTA}}\1{{RESET}} @g

# sql
s/\(BEGIN\|SELECT\|FROM\|WHERE\|LIMIT\|AS\|CREATE\) /{{MAGENTA}}\1{{RESET}} /ig
s/\(DELETE\) /{{RED}}\1{{RESET}} /ig

# command args
s@\([\^\[\ \t]\)\(-\+\w\+\)@\1{{CYAN}}\2{{RESET}}@g

# example
s@\/\(admin\)/@/{{RED}}\1{{RESET}}/@

# replace variable colors
s@{{RED}}@\x1b[0;31m@g
s@{{GREEN}}@\x1b[0;32m@g
s@{{YELLOW}}@x1b[0;33m@g
s@{{BLUE}}@\x1b[0;34m@g
s@{{MAGENTA}}@\x1b[0;35m@g
s@{{CYAN}}@\x1b[0;36m@g
s@{{RESET}}@\x1b[0m@g

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
