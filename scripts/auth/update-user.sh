#!/bin/bash
FIRSTNAME='muda'
LASTNAME='mudadd'
CODERNAME='mudabish'
DEVCRED=10
FOURSCREENS=true
# ATTRIBUTES='{ "javaScript": 2, "sass": 2 }'
# ABILITIES='{ "bugSlayer": true, "docMaster": true }'

TOKEN='nuQy2q+yoAvQ/8AbzGpX9QTxcuAC6hk110Nqwc+TVOM=--na+aj72yhgh1ST/Eiaa0Ti8ikeGKZxmub6esZPIXU44='
ID='59a04350d6b99215d9bbb8d1'

API="http://localhost:4741"
URL_PATH="/update-user"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "firstName": "'"${FIRSTNAME}"'",
      "lastName": "'"${LASTNAME}"'",
      "coderName": "'"${CODERNAME}"'",
      "devCred": "'"${DEVCRED}"'",
      "fourScreens": "'"${FOURSCREENS}"'"
    }
  }'

echo

# "attributes": "'"${ATTRIBUTES}"'",
# "abilities": "'"${ABILITIES}"'"
