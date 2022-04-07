#!/bin/bash
###
# File Name:
#     free_memory.sh
#
# Details:
#     Frees all teh shared memory segments with nobody attached to them. This
#     is useful when an application (such as cFE) doesn't clean its shared
#     memory on a shutdown.
###

# head & tail strip out leading/trailing garbage
ipcs -m | head -n -1 | tail -n +4 | while read LINE
do
   read KEY SCHMID OWNER PERMS BYTES NATTACH STATUS <<<$LINE

   if [ $NATTACH -eq "0" ]
   then
      ipcrm -m $SCHMID
      echo "'ipcrm -m $SCHMID' was $? (0 = successful)"
   fi
done