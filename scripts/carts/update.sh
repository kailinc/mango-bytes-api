#!/bin/bash
TOKEN='Ky8Tz1FZfhWfbeL83q23H3ZHoTrurrAm/LIKI23RRus=--L/ukz79kMBQ1qH7DijplVEIqkBv9kGLGaft7L9YS2lc='
ID='59a703c50ee2cd2a175be556'
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "products": []
    }
  }'

echo
