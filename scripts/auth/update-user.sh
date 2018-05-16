#!/bin/bash
TOKEN='sM06dDMP0W4NSM6MMemiodiYE5+Ut0k9cyZcUu/Hj1k=--glqBsw5J8z2Jo9FEo7dgdEFmS9GGsqLGbaj4bBBUfSo='
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
