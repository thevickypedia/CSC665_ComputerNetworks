#!/bin/bash

##log information has been saved to a key value LOG 
LOG=/home/vignesh/Desktop/present/logs/`/bin/date +\%Y\%m\%d\%H\%M`_internet_monitoring.log

##email address to which the mail has to trigger has been specified
EMAIL=vignesh.sivanandarao@gmail.com

#ping aa.com 5 times and log the information to the LOG file and path specified
                ping -c 5 aa.com >> $LOG 

#print the title for telnet 443 in the log file 
                echo $'\ntelnet through port 443\n' >> $LOG 

#start telnet aa.com through port 443 and add the information to current log file
                sleep 5 | telnet aa.com 443 >> $LOG 

#print the title for telnet 80 in the log file 
                echo $'\ntelnet through port 80\n' >> $LOG 

#start telnet aa.com through port 80 and add the information to current log file
                sleep 5 | telnet aa.com 80 >> $LOG 
				
				echo $'\n' >> $LOG 

#start tracerouting aa.com and add the information to current log file
	sudo traceroute -I aa.com >> $LOG 
	
	echo $'\n' >> $LOG
	
#the loop below checks for the packet information in the log file that has been updated so far and if it isn't found it will print the message and trigger an email to the user  

	for filename in $LOG; do

 if [ "$(grep "5 packets transmitted, 5 received" $filename)" ]; then

   echo "`date`: Connection OK, host is up!" >> $LOG

   else

   echo "`date`: Connection failure identified!" >> $LOG |

#included -e to accept empty body message 
   mail -e -s "Attention Required! Unable to reach aa.com!" $EMAIL 

   fi

done 

exit
