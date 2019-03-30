#!/bin/bash
###Cron job to purge files older than 30 mins /dev/null is used to discard any error messages
find /home/vignesh/Desktop/present/logs -name "*log*" -type f -mmin +30 -delete > /dev/null
