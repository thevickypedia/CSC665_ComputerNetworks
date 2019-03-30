#!/bin/bash 

##log information has been saved to a key value LOG 
LOG=/home/vignesh/Desktop/present/logs/`/bin/date +\%Y\%m\%d\%H\%M`_ondemand_monitoring.log

##email address to which the mail has to trigger has been specified
EMAIL=vignesh.sivanandarao@gmail.com 

##takes the command line input
while true; do 
	for i in $@; do 

#ping the specified host 5 times and logs the information to the LOG file and path specified
		ping -c 5 $i &> /dev/null >> $LOG 

#print the title for telnet 443 in the log file 
                echo $'\ntelnet through port 443\n' >> $LOG 

#start telnet through port 443 and add the information to current log file
		sleep 5 | telnet $i 443 >> $LOG 

#print the title for telnet 80 in the log file 
                echo $'\ntelnet through port 80\n' >> $LOG 

#start telnet through port 80 and add the information to current log file
		sleep 5 | telnet $i 80 >> $LOG 
		
	echo $'\n' >> $LOG 

#for i in $@; do

#start tracerouting and add the information to current log file

sudo traceroute -I $i >> $LOG 

	echo $'\n' >> $LOG
	
#the loop below checks for the packet information in the log file that has been updated so far and if it isn't found it will print the message and trigger an email to the user  

 if [ "$(grep "5 packets transmitted, 5 received" $LOG)" ]; then

   echo "`date`: Connection OK, $i is up!" >> $LOG

else 

   echo "`date`: Connection failure identified!" >> $LOG | 

#included -e to accept empty body message 
   mail -e -s "Attention Required! Unable to reach $i!" $EMAIL 

   fi

done 
exit
done 
