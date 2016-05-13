#!/bin/bash
#Simple locate plugin example.
#Put me in ~/.config/gambas3/higgins/extbin to use me

export IFS=$'\n'
minchar=3   #Don't search on queries smaller than that.

query="$@"
len=${#query}

if [ $len -lt $minchar ] ; then
    exit
fi

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
