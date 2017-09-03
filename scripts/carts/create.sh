#!/bin/bash

TOKEN='BseBu76jnzgBP1PMu1RgI6L4T2uRyFLKm6wiYufNxKg=--5mgITLr/mDtD1lfhXDiknVNKcqCY9MmT/HHSn+x5VTQ='
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "products": [{"item_id": "59a197c79f399e9a7f9725b0", "quantity": "3000"}]
    }
  }'

echo
