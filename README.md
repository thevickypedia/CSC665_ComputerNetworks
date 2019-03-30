# CSC665_ComputerNetworks
Alert Monitoring setup using bash scripts

READ ME: Alert Monitoring Application

Prerequisites:
1. A valid email address (gmail, yahoo etc)
2. Login access and sudo access to any Linux Machine (preferably ubuntu)
3. Working ping, telnet and traceroute functions
4. Working SMTP connection and should run from a network where SMTP is not blocked
5. crontab entry

Contents of the directory:
* CSC_665_Project_Report.docx
* CSC_665_Project_Slides.pptx
* Final_Demo.mp4
* crontab.txt
* hostmonitor.sh (to monitor a host)
* internetmonitor.sh (to monitor any url on the web)
* ondemand.sh (to provide website host in command line)
* purge.sh (to purge the log files older than 30 minutes)

Running the tests:
1. Install traceroute function ("sudo apt-get install traceroute")
2. Setup mail utilities ("sudo apt-get install mailutils")
	* Select "Internet Site" in the Postfix configuration
	* Choose a System mail name (just ok for default "ubuntu")
3. Setup cron entry ("crontab -e" insert the data from crontab.txt file)
4. Un-commend (remove the # mark in front of the particular entry) the job entry to start

Bugs:
No bugs

Remarks:
The script hostmonitor.sh is set to look for an ip 192.168.0.98 on the network. This was done for testing purpose as I needed to check the actual working from the crontab. This has to be changed before trial.
The scripts do not trigger email when trigged from missouristate college network as they might have blocked SMTP communications but the same works from other private networks
