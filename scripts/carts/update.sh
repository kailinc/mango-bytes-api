#!/bin/bash
TOKEN='x+H8wci5MO/UpAbll0dbEl3/gwJW+AmhBQy47HbCBM=--+i3EGuBKKGJNl5dY1kWSnxVQUOTiOq6yuyXJx47Cqsc='
ID='59a1b16c1236ed66d04203c8'
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "products": [{"item_id": "59a197c79f399e9a7f9725af", "quantity": "11", "price": "10"}, {"item_id": "59a197c79f399e9a7f9725b0", "quantity": "30", "price": "10"}]
    }
  }'

echo
