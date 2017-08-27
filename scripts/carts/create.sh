#!/bin/bash

TOKEN='MJ2dnx5bLZ0+g/hY8REbVsc5J0bawPyK0ZdPW2ji3CU=--Pl5iuMZ9oh/BuW4+bh+Jypd2LGDRAZihxeTfNiArqD0='
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "products": [{"item_id": "59a197c79f399e9a7f9725af", "quantity": "20", "price": "1"}, {"item_id": "59a197c79f399e9a7f9725b0", "quantity": "30", "price": "10"}]
    }
  }'

echo
