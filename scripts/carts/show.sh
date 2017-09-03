#!/bin/sh
TOKEN='/wNij9EFCIcbQeDaeoyPTXvDxVIRQZ+d1vlyw286Ut4=--B/UIObYg/gHvdEuqM3FmozHmpMr7mUZ6PUBEBKduJTM='
ID='59a70a44ee1a7e2d45c629e7'
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
