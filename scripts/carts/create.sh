#!/bin/bash

TOKEN='v7//MuxLUAHDpz0300sE4guomkXHfJBzh1UHMPczCMA=--xj/85SMt1E95lyMpNyyBtB4ptNuiWk5R01d1D5d7wHg='
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "products": [{"item": "59a197c79f399e9a7f9725af", "quantity": "99", "name": "javaScript", "img": "https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/js.png", "devCred": "100", "basePrice": "5", "attributes": "javaScript+2" }, {"item": "59a197c79f399e9a7f9725b0", "quantity": "2", "name": "python", "img": "https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/python.png", "devCred": "100", "basePrice": "5", "attributes": "python+2" }]
    }
  }'

echo
