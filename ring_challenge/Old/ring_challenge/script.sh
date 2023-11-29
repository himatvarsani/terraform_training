#!/bin/bash
FILE=/tmp/file
KEY=/home/.ssh/key.pem
if test -f "$FILE"; then
   # Read file and increment the number
        num=cat $FILE
        num=$((num+=1)) && echo $num > $FILE
        MYIP=ifconfig en0 | awk '$1 == "inet" {print $2}'
    # Find the next server to send it to
                if [[ $MYIP = "192.168.21.63" ]]; then
                        scp -i $KEY $FILE 192.168.21.82:/tmp/file
                fi
                if [[ $MYIP = "192.168.21.82" ]]; then
                        scp -i $KEY $FILE 192.168.21.175:/tmp/file
                fi
                if [[ $MYIP = "192.168.21.175" ]]; then
                        scp -i $KEY $FILE 192.168.21.183:/tmp/file
                fi
                if [[ $MYIP = "192.168.21.183" ]]; then
                        scp -i $KEY $FILE 192.168.21.222:/tmp/file
                fi
                if [[ $MYIP = "192.168.21.222" ]]; then
                        scp -i $KEY $FILE 192.168.21.63:/tmp/file
                fi
        rm $FILE
fi