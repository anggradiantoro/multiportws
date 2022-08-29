#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

#license
echo -e "============================================="
echo -e " ${GREEN} SCRIPT LICENSE${NC}"
echo -e "============================================="
sleep 2
read -p "SILA MASUKKAN LESEN SCRIPT: " pwd
if test $pwd == "jinggo007"; then
echo "Password Accepted!"
else
echo "Password Incorrect!"
rm -f setup.sh
sleep 2
exit 0
fi

data=(`find /var/log/ -name '*.log'`);
for log in "${data[@]}"
do
echo "$log clear"
echo > $log
done
data=(`find /var/log/ -name '*.err'`);
for log in "${data[@]}"
do
echo "$log clear"
echo > $log
done
data=(`find /var/log/ -name 'mail.*'`);
for log in "${data[@]}"
do
echo "$log clear"
echo > $log
done
echo > /var/log/syslog
echo > /var/log/btmp
echo > /var/log/messages
echo > /var/log/debug

bcc=`date`
echo "Successfully clean log at $bcc"
