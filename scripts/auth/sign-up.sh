#!/bin/bash
FIRSTNAME='kailin'
LASTNAME='chen'
CODERNAME='KaiBoard'
EMAIL='z14@z14'
PASSWORD='z14'
PYTHON="Python"
LEVEL='10'
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
      "JavaScript": "'"${LEVEL}"'",
      "skills": [
        {
          "name": "'"${PYTHON}"'",
          "level": "'"${LEVEL}"'"
        }
      ]
    }
  }'

echo
