#!/bin/sh
TOKEN='Rl34ikJNsXMFyMPhcDTcDDhp6XMa3OHLsiiav1bsnr0=--MB13eVGtqdBkL1/8IRuaZTlSNDy6i+72FL5pKnzd/R8='
ID='5abba9b556c5477953f091f9'
API="http://localhost:4741"
URL_PATH="/own-carts"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
