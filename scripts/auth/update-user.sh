#!/bin/bash
TOKEN='TBMxNJTe2Ut/e2EF+hlOulk7zfl2WgSux1jRPt8F9bs=--HfQO6j7w9m6J1dwZ4mzn1bUjmyKhim+EUFeOVC7qcXc='
ID='5ad4b31852bb4327aa952e6c'

API="http://localhost:4741"
URL_PATH="/update-user"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "user": {
      "JavaScript": "30"
    }
  }'

echo
