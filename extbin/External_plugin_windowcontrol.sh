
#!/bin/bash
#Grep plugin
#Put me in ~/.config/gambas3/higgins/extbin to use me

#This plugin will list every line in $srcfile matching the query

export IFS=$'\n'
trigger=""   #No trigger
minchar=4    #Don't search on queries smaller than that, trigger does not count.

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


#Exit if the query is too small
if [ ${#query} -lt $minchar ] ; then
	exit ;
fi

SCRIPTDIR="${0%/*}"

matches=$(wmctrl -l | grep -vi " -1 " | grep -i "$query" | awk '{$2="";print}')
for window in $matches ; do 

	echo BEGIN
	wid=$(echo $window | cut -d " " -f 1)
	title=$(echo $window | cut -d " " -f 2-)
	# For fields description and possible values, please refer to plugins/plugin_999_template
		echo Text=$title
		echo SubText="Raise and focus this window"
		echo Image_file="resize://$SCRIPTDIR/support/windowcontrol.png"
		echo Clipboard_data=$title
		echo Action="EXEC"
		echo Action_p=wmctrl -i -R $wid
	echo END
done
