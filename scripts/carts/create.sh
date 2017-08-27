#!/bin/bash

TOKEN='3dNAkaBP8s3GR40ZN28nS1tetShSlhFwuqd+d87tAvk=--/86l+OENLyyjNAF2io7lUIU/xno3woAUuYwQjB9mGx8='
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "products": [{"item_id": "59a197c79f399e9a7f9725b0", "quantity": "300", "price": "100"}]
    }
  }'

echo
