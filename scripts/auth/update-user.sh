#!/bin/bash
FIRSTNAME='happy'
LASTNAME='wow'
CODERNAME='dam'
FOURSCREENS=true
DEVCRED=99
WALKINGGOOGLE=true
DOCMASTER=true
BUGSLAYER=true
STEADYHANDS=true
FIREFINGERS=true
COFFEEATM=true



TOKEN='B2AeZmOADLDzv8N8vExC/K+2EishtkFPFgH9dDYG0t0=--37aYxzVXjzIzMicykavA22rf6YDoBCk3bLHJQIAQud4='
ID='59a45454be19d314e72d546f'

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
      "skills": [{"name": "javaScript", "level": "99"}, {"name": "python", "level": "99"}],
      "docMaster": "'"${DOCMASTER}"'",
      "bugSlayer": "'"${BUGSLAYER}"'",
      "steadyHands": "'"${STEADYHANDS}"'",
      "fireFingers": "'"${FIREFINGERS}"'",
      "coffeeATM": "'"${COFFEEATM}"'",
      "fourScreens": "'"${FOURSCREENS}"'"

    }
  }'

echo
