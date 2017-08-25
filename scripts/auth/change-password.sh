#!/bin/bash
OLDPW='kai'
NEWPW='why'
TOKEN='zBpAFZ5HaFEoDJIWqw1Z5YaN9dZc6Ebg5Ue8TBM2RzQ=--1u1eE99BgWWNNwwrwfYyAB8mfrmSeZxldRQMAf2Llr8='
ID='59a032b03eb6d30d77e9ed5f'

API="http://localhost:4741"
URL_PATH="/change-password"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'

echo
