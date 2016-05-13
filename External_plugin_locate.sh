#!/bin/bash
#Simple locate plugin example.
#Put me in ~/.config/gambas3/higgins/extbin to use me

#This plugin will search for files using locate command, which has to be installed.
#This plugin will run only when the trigger is used, so:
#   to search for "myfile.txt"
#   write: l:myfile.txt
#   (trigger is "l:")

#This plugin will not search anything lower than 3 characters (minchar=3)


export IFS=$'\n'
trigger="l:" #Search using the trigger? es: l:myfile
minchar=3    #Don't search on queries smaller than that, trigger does not count.

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


#Finally, start the search:
for file in $(locate -i "$query") ; do
    echo BEGIN
    # For fields description and possible values, please refer to plugins/plugin_999_template
      echo Text=$(basename $file)
      echo SubText="in " $(dirname $file)"/"
      echo Image_file="mimetype://$file"
      echo Clipboard_data="$file"
      echo Action="GUESS"
      echo Action_p="$file"
    echo END
done
