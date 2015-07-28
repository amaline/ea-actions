#!/usr/bin/env bash

message="undefined"

TEMP=`getopt -o m: --long message: -n 'st2-ea.ea-notify' -- "$@"`
eval set -- "$TEMP"

while true; do
   case "$1" in
     --message)
	  message="$2"; shift 2;;
     --) shift; break ;;
     *) echo "no message passed!"; exit 1;;
   esac
done
        

echo "message>>${message}<<"
echo "pwd>>${PWD}<<"

if [[ $message == "undefined" ]]; then
    SMS_MESSAGE="notification with no message passed."
else
    SMS_MESSAGE=$message
fi

aws sns publish --topic-arn="arn:aws:sns:us-east-1:022218916186:notify-ea" --message="$SMS_MESSAGE"
