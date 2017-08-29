#!/bin/bash

TOKEN='M03gNqv6t0xNW96A6iNMWjyOvXMMcL1W2zvXwMYMPlE=--d4iS6pk8tGw/QL24yK9HETH12Hq9LXU18MFBhKbcMPk='
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "products": [{"item_id": "59a197c79f399e9a7f9725b0", "quantity": "300", "price": "100", "devCred": "100"}, {"item_id": "59a197c79f399e9a7f9725b0", "quantity": "300", "price": "100", "devCred": "200"}]
    }
  }'

echo
