#!/bin/bash
name=${1};
if [ ! -n "${name}" ] ;then
    echo "please input param [eureka|config|gateway]"
    exit 0;
fi
# 设置进程名关键词
process_keyword="cmp-fw-${name}-1.0.0-SNAPSHOT.jar"
pid=$(ps -ef | grep java | grep "$process_keyword" | grep -v "grep" | awk '{print $2}')
if [ -z "$pid" ]
 then
    echo "Java start \"$process_keyword\"";
    nohup java -jar cmp-fw-${name}-1.0.0-SNAPSHOT.jar > $name.out 2>&1 &
 else 
    echo "Java process with pid $pid and keyword \"$process_keyword\" is running"
fi
