#!/bin/bash
TOKEN='8mgaevie6kzhh7CQzhxCmfvptmLQzEyiKZz/yHfvbX0=--kivGfRggidfPfpuzKU2MD3w+ncWfyhKlHkd/PX75CeE='
ID='59a57f0750c71d5a4eff9836'
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "products": [{"item_id": "59a197c79f399e9a7f9725b0", "quantity": "300", "price": "10"}],
      "isPaid": "true"
    }
  }'

echo
