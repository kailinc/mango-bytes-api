#!/bin/bash
ID='59a04350d6b99215d9bbb8d1'
API="http://localhost:4741"
URL_PATH="/users"
TOKEN='nuQy2q+yoAvQ/8AbzGpX9QTxcuAC6hk110Nqwc+TVOM=--na+aj72yhgh1ST/Eiaa0Ti8ikeGKZxmub6esZPIXU44='

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
