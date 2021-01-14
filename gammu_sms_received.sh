#!/bin/bash
MESSAGE_HEADER="Message reçu de $SMS_1_NUMBER \\n\\n"
MESSAGE_CONTENT=""

for i in `seq $SMS_MESSAGES` ; do
	MESSAGE_CONTENT=$(echo  "${MESSAGE_CONTENT}"; eval "echo  \"\${SMS_${i}_TEXT}\"";);

done
    

MESSAGE=$(echo -e -n "${MESSAGE_HEADER}";echo "${MESSAGE_CONTENT}")
echo "${MESSAGE}" | gammu-smsd-inject TEXT 06XXXXXX -unicode -len 1500
echo "${MESSAGE}"| sed 's/$/<br \/>/' | mailx -s "Nouveau SMS" xxxxxx@gmail.com -a "From: Server SMS <xxxxx@colas-delmas.fr>" -a "Content-Type: text/html; charset=UTF-8"
