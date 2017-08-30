#!/bin/bash

TOKEN='mxdMLy1IvY7WZhBuf8bAp1OaMSY49rml9Rp5HGl2Cxw=--qf3W8b4L3DrlhiMOtEtTMZIRBFj8JNrOHd5g9eSvWaU='
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "products": [{"item": "59a197c79f399e9a7f9725b0", "quantity": "99", "name": "javaScript", "img": "https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/js.png", "devCred": "100", "basePrice": "5", "attributes": "javaScript+2" }]
    }
  }'

echo
