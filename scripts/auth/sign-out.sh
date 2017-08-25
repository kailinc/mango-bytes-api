#!/bin/bash
TOKEN='+1Ic0KVCBgAyoL0sFSIs52JD97Vhdy22vtW8SXqyq+M=--lKzFdwITjXp1wRlNQGiNiz/ogDlBcDvQjK1yUScxdNQ='
ID='59a032b03eb6d30d77e9ed5f'

API="http://localhost:4741"
URL_PATH="/sign-out"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
