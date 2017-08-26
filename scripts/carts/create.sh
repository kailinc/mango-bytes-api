#!/bin/bash
TEXT='mmmmmy bucket'
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
      "text": "'"${TEXT}"'"
    }
  }'

echo
