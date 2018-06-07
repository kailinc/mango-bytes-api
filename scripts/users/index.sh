#!/bin/bash
TOKEN='QSsdfqKFax3ieH/cBI7pAOdeuuJypeOqOqfTBPQxcc8=--6JSqkHEwhrjHc2VsKqon62sNFV5lJ6FX3Oja546/uG4='
API="http://localhost:4741"
URL_PATH="/users"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
