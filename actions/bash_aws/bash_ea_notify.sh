#!/usr/bin/env bash

message=$1

echo "message>>${message}<<"
for arg in "$@"; do
  echo "arg>>${arg}<<"
done

if [[ ! $message ]]; then
    # count variable not set so default to 3
    SMS_MESSAGE="notification with no message passed."
else
    SMS_MESSAGE=$message
fi

aws sns publish --topic-arn="arn:aws:sns:us-east-1:022218916186:notify-ea" --message="$SMS_MESSAGE"
