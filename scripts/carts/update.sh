#!/bin/bash
TOKEN='00Qa4+FNZ6qIQdVlh1G2zh4741/zwEEsxghmlPBlmOQ=--J8DOC4lwr7g8yMFDqK379O+hC5a76j2pdSlVXPUzyPM='
ID='5ad93f9086a4a3ecaa58ac00'
API="http://localhost:4741"
URL_PATH="/update-cart"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "items": []
    }
  }'

echo
