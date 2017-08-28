#!/bin/bash
FIRSTNAME='happy'
LASTNAME='wow'
CODERNAME='dam'
FOURSCREENS=true
DEVCRED=99




TOKEN='hZrOWt99tVLz5OJNn0TWv1vkwYB4ttxQoBpkphI1P/A=--MOkqfSJleLw1vnGbGVtDaqeX5XFsuYKsyRrLDMeTOuY='
ID='59a457905a5a88168522c72a'

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
      "skills": [{"name": "javaScript", "level": "199"}, {"name": "python", "level": "199"}],
      "powers": [{"name": "docMaster", "img": "https://s3.us-east-2.amazonaws.com/mango-bytes/super-ability/doc-master.png"}, {"name": "bugSlayer", "img": "https://s3.us-east-2.amazonaws.com/mango-bytes/super-ability/debugg-king.png"}, {"name": "fireFingers", "img": "https://s3.us-east-2.amazonaws.com/mango-bytes/super-ability/9000-wpm.png"}, {"name": "coffeeATM", "img": "https://s3.us-east-2.amazonaws.com/mango-bytes/super-ability/free-coffee.png"}, {"name": "steadyHands", "img": "https://s3.us-east-2.amazonaws.com/mango-bytes/super-ability/precise-typer.png"}, {"name": "humanGoogle", "img": "https://s3.us-east-2.amazonaws.com/mango-bytes/super-ability/walking-google.png"} ],
      "fourScreens": "'"${FOURSCREENS}"'"
    }
  }'

echo
