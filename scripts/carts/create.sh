#!/bin/bash

TOKEN='Ky8Tz1FZfhWfbeL83q23H3ZHoTrurrAm/LIKI23RRus=--L/ukz79kMBQ1qH7DijplVEIqkBv9kGLGaft7L9YS2lc='
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "products": [{"item_id": "59a197c79f399e9a7f9725b0", "quantity": "3000"}]
    }
  }'

echo
