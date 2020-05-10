#!/bin/bash
generate_post_data()
{
username=YOURUSERNAME
password=YOURPASSWORD
  cat <<EOF
{
  "username": "$username", 
  "password": "$password",
  "recaptcha": ""
}
EOF
}
hostname=YOURFILEBROWSERHOSTNAME


payload=$(generate_post_data)
echo $payload
TOKEN=$(curl -s -X POST -H 'Accept: */*' -H 'Content-Type: application/json' --data "$payload"  https://${hostname}/api/login)
echo $TOKEN

curl -X GET -H 'Accept: application/json' -H "x-auth: $TOKEN" https://${hostname}/api/resources/

curl -X POST -H 'Accept: application/json' -H "x-auth: $TOKEN" https://${hostname}/api/resources/test1/?override=false
