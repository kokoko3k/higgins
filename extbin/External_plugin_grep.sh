#!/bin/bash                                                                                                                                                    
#Grep plugin, useful for contacts file (one contact per line)                                                                                                                                              
#Put me in ~/.config/gambas3/higgins/extbin to use me                                                                                                          
                                                                                                                                                               
#This plugin will list every line in $srcfile matching the query                                                                                               
                                                                                                                                                               
export IFS=$'\n'                                                                                                                                               
trigger=""   #No trigger                                                                                                                                       
minchar=4    #Don't search on queries smaller than that, trigger does not count.                                                                               
                                                                                                                                                               
query="$@"                                                                                                                                                     
                                                                                                                                                               
len=${#query}                                                                                                                                                  
                                                                                                                                                               
#Exit if the query is too small                                                                                                                                
if [ $len -lt $minchar ] ; then                                                                                                                                
        exit ;                                                                                                                                                 
fi

SCRIPTDIR=${0%/*}

srcfile=/home/koko/documenti/mycontacts.txt
results=$(grep -i "$query" $srcfile) || exit

#Finally, start the search:

for result in $results ; do
  echo BEGIN
        # For fields description and possible values, please refer to plugins/plugin_999_template
    echo Text=$result
    echo SubText=In $(basename $srcfile)
    echo Image_file="resize://$SCRIPTDIR/support/grep.png"
    echo Clipboard_data=$result
    echo Action="CLIPBOARD"
    echo Action_p=$result
  echo END
done
