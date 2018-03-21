#!/bin/bash
TOKEN='JDzqmZd/iv/hQGgV+0/aaW0G76kLAcS/+brVnTqjpu8=--UASWMoB56PP+XqD1U97sIQ1Kl3XrTE2NFBecAwkav+o='
ID='5ab26b262d77233e9cfa9fed'

API="http://localhost:4741"
URL_PATH="/update-user"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "JavaScript": "10",
      "Python": "10",
      "C": "10",
      "Css": "10",
      "Go": "10",
      "Html": "10",
      "Java": "10",
      "Ruby": "10",
      "Angular": "10",
      "React": "10",
      "BootStrap": "10",
      "Django": "10",
      "Ember": "10",
      "MongoDB": "10",
      "Sql": "10",
      "Node": "10",
      "Rails": "10"
    }
  }'

echo
