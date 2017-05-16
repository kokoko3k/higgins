#!/bin/bash
#Simple locate plugin example.
#Put me in ~/.config/gambas3/higgins/extbin to use me

#This plugin will list active processes and kill them on selection

#                   !WITHOUT ASKING FOR CONFIRMATION!


#This plugin will run only when the trigger is used, so:
#	to search for "firefox"
#	write: k:firef 
#	(trigger is "k:")

#This plugin will list every process with "k:"


export IFS=$'\n'
trigger="k:" #Search using the trigger? es: l:myfile
minchar=0    #Don't search on queries smaller than that, trigger does not count.

query="$@"

#Do we use a trigger?
if [ -n "$trigger" ] ; then
	#...Yes, we do, so exit if not triggered
	if [[ $query != $trigger* ]] ; then
		exit
	fi
	#Strip the trigger prefix from the query
	query=$(echo $query| sed "s/^$trigger//")
fi

len=${#query}

#Exit if the query is too small
if [ $len -lt $minchar ] ; then
	exit ;
fi

SCRIPTDIR=${0%/*}
#Finally, start the search:
for proc in $( ps -e --sort=cmd | grep -e '[0-9]' |grep "$query") ; do
	name=$(echo $proc | awk  '{ print $4 }')
	pid=$(echo $proc | awk  '{ print $1 }')
	ttime=$(echo $proc | awk  '{ print $3 }')
    echo BEGIN
    # For fields description and possible values, please refer to plugins/plugin_999_template
      echo Text=Process name: $name '(' $pid ')'
      echo SubText="Time: $ttime"
      echo Image_file="resize://$SCRIPTDIR/support/kill.png"
      echo Clipboard_data=$name
      echo Action="EXEC"
      echo Action_p="kill $pid"
    echo END
done

