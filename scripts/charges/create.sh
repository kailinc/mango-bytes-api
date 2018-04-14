#!/bin/bash
TOKEN='+BBuP7zm2tloQWQvUDBsCUU0U8aTZoNT5Qp4XUUIrkg=--tlN1kDIiAa3Bg4FDPDokZVCIMuGxZ1qXi1D2SD1w7B4='
API="http://localhost:4741"
URL_PATH="/charges"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
      "charge": {
        "id": "10",
        "email": "oklalala"
      }
  }'

echo
