#!/bin/bash

TOKEN='nZSFkREU9lW+VeJIsb5udKaO4btZ7Dq7hDjDlsM7ywI=--FjndV6WFOfwlSDSH4sU070KENLF7D0Ll6vyZ9SG4AWA='
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "products": [{"item_id": "59a197c79f399e9a7f9725af", "quantity": "1", "price": "-1"}, {"item_id": "59a197c79f399e9a7f9725b0", "quantity": "30", "price": "10"}]
    }
  }'

echo
