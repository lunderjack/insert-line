#!/bin/bash

APPNAMES=( example02 example03 example04 )
ARRAY_CNT=$((${#APPNAMES[@]}))
CNT=0
LINE=2
ADD=./add.txt
ENV=dev

while [ "$CNT" -lt "$ARRAY_CNT" ]
do
  export APPNAME=${APPNAMES[$CNT]}
  echo $APPNAME
#  sed ''"$LINE"'r '"$ADD"'' example.yaml
sed -i. ''"$LINE"'i \
        This is '"${APPNAME}"'.\
        It is in the '"$ENV"' environment.\
\
        The '"$ENV"' env has the '"${APPNAME}"' app.\
        END' example.yaml
  (( CNT += 1 ))
  (( LINE += 5 ))
done

exit 0
