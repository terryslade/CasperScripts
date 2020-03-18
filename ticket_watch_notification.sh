#!/bin/sh
#############################################################################
#
# ABOUT THIS PROGRAM
#
# NAME
#	ticket_watch_notification.sh --  Ticket watch notification framework
#
# DESCRIPTION
#	This script sets downloads the formatted scheduling doc | sets date, hour and time variables |
#       parses the downloaded sheets and located a value match based on the time variables | returns the sheets value in a  MAC OS notifcation
#############################################################################
# HISTORY
#
# Version: 1.0
#	Intitial release
#
# Created by Terry Slade - 5/8/2017
# IT System Administrator
#
#############################################################################

curl 'https://docs.google.com/spreadsheets/d/1N_5bxj0f41CAwzN93wLNNB0PR5T4tfw4PTUhx4wv2Yk/pub?gid=1795279293&single=true&output=csv' > /var/tmp/ticket_watch.csv

sleep 5s


CURRENT_DATE=$(date +'%-m/%d/%Y') 
CURRENT_HOUR=$(date +"%-H")
CURRENT_TIME=$(date -v +1H +"%-l %p")



_8AM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f6)
_8AM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f7)

_9AM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f9)
_9AM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f10)

_10AM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f12)
_10AM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f13)

_11AM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f15)
_11AM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f16)

_12PM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f18)
_12PM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f19)

_1PM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f21)
_1PM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f22)

_2PM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f24)
_2PM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f25)

_3PM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f27)
_3PM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f28)

_4PM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f30)
_4PM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f31)

_5PM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f33)
_5PM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f34)

_6PM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f36)
_6PM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f37)

_7PM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f39)
_7PM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f40)

_8PM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f42)
_8PM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f43)

_9PM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f45)
_9PM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f46)

_10PM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f48)
_10PM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f49)

_11PM_Primary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f51)
_11PM_Secondary=$(cat /var/tmp/ticket_watch.csv | grep "$CURRENT_DATE" | cut -d',' -f52)



if (($CURRENT_HOUR == 8)); #notification for _8AM-9AM
	then 
		/Library/Application\ Support/JAMF/bin/Management\ Action.app/Contents/MacOS/Management\ Action -title "Ticket Watch" -subtitle "Now through "$CURRENT_TIME"" -message "Primary: "$_8AM_Primary"  |  Secondary: "$_8AM_Secondary""

	elif (($CURRENT_HOUR == 9)); #notification for _9AM-10AM
		then 
			/Library/Application\ Support/JAMF/bin/Management\ Action.app/Contents/MacOS/Management\ Action -title "Ticket Watch" -subtitle "Now through "$CURRENT_TIME"" -message "Primary: "$_9AM_Primary"  |  Secondary: "$_9AM_Secondary""

	elif (($CURRENT_HOUR == 10)); #notification for _10AM-11AM
		then 
			/Library/Application\ Support/JAMF/bin/Management\ Action.app/Contents/MacOS/Management\ Action -title "Ticket Watch" -subtitle "Now through "$CURRENT_TIME"" -message "Primary: "$_10AM_Primary"  |  Secondary: "$_10AM_Secondary""

	elif (($CURRENT_HOUR == 11)); #notification for _11AM-12PM
		then 
			/Library/Application\ Support/JAMF/bin/Management\ Action.app/Contents/MacOS/Management\ Action -title "Ticket Watch" -subtitle "Now through "$CURRENT_TIME"" -message "Primary: "$_11AM_Primary"  |  Secondary: "$_11AM_Secondary""

	elif (($CURRENT_HOUR == 12)); #notification for _12PM-1PM
		then 
			/Library/Application\ Support/JAMF/bin/Management\ Action.app/Contents/MacOS/Management\ Action -title "Ticket Watch" -subtitle "Now through "$CURRENT_TIME"" -message "Primary: "$_12PM_Primary"  |  Secondary: "$_12PM_Secondary""

	elif (($CURRENT_HOUR == 13)); #notification for _1PM-2PM
		then 
			/Library/Application\ Support/JAMF/bin/Management\ Action.app/Contents/MacOS/Management\ Action -title "Ticket Watch" -subtitle "Now through "$CURRENT_TIME"" -message "Primary: "$_1PM_Primary"  |  Secondary: "$_1PM_Secondary""

	elif (($CURRENT_HOUR == 14)); #notification for _2PM-3PM
		then 
			/Library/Application\ Support/JAMF/bin/Management\ Action.app/Contents/MacOS/Management\ Action -title "Ticket Watch" -subtitle "Now through "$CURRENT_TIME"" -message "Primary: "$_2PM_Primary"  |  Secondary: "$_2PM_Secondary""

	elif (($CURRENT_HOUR == 15)); #notification for _3PM-4PM
		then 
			/Library/Application\ Support/JAMF/bin/Management\ Action.app/Contents/MacOS/Management\ Action -title "Ticket Watch" -subtitle "Now through "$CURRENT_TIME"" -message "Primary: "$_3PM_Primary"  |  Secondary: "$_3PM_Secondary""

	elif (($CURRENT_HOUR == 16)); #notification for _4PM-5PM
		then 
			/Library/Application\ Support/JAMF/bin/Management\ Action.app/Contents/MacOS/Management\ Action -title "Ticket Watch" -subtitle "Now through "$CURRENT_TIME"" -message "Primary: "$_4PM_Primary"  |  Secondary: "$_4PM_Secondary""

	else (($CURRENT_HOUR == 17)); #notification for _5PM-6PM

			/Library/Application\ Support/JAMF/bin/Management\ Action.app/Contents/MacOS/Management\ Action -title "Ticket Watch" -subtitle "Now through "$CURRENT_TIME"" -message "Primary: "$_5PM_Primary"  |  Secondary: "$_5PM_Secondary""
fi

