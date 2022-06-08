tail -Fn0 logfile | \
while read line ; do
        echo "$line" | grep "java.sql.SQLRecoverableException"
        if [[  $(echo "$line" | grep "java.sql.SQLRecoverableException") || $(echo "$line" | grep "Transaction timed out") ]]
        then
                echo "hi"
             nohup  timeout 20 tcpdump -i any port 22 -w /tmp/sshcap1  & 
        fi

done

