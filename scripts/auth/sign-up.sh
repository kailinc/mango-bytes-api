#!/bin/bash
FIRSTNAME='kai'
LASTNAME='chen'
CODERNAME='MudaBish'
EMAIL='11@11'
PASSWORD='11'
ATTRIBUTES= '{ "javaScript" : 10 }'
API="http://localhost:4741"
URL_PATH="/sign-up"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "firstName": "'"${FIRSTNAME}"'",
      "lastName": "'"${LASTNAME}"'",
      "coderName": "'"${CODERNAME}"'",
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'",
      "attributes": "'"${ATTRIBUTES}"'"
    }
  }'

echo
