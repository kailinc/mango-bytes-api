#!/bin/bash
TOKEN='pki/5BNYnaxoqtvGcXbmkf37bVjNuR7WcA2KvGHWpvM=--TYy0npy6OSz+EW3HwegucSfOAWtaaE+/eZkG3caUd+U='
ID='5abba9b556c5477953f091f9'

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
