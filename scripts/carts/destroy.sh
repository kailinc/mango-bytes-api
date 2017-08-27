#!/bin/bash
TOKEN='MJ2dnx5bLZ0+g/hY8REbVsc5J0bawPyK0ZdPW2ji3CU=--Pl5iuMZ9oh/BuW4+bh+Jypd2LGDRAZihxeTfNiArqD0='
ID='59a212138da2eb6a63e45ce7'
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
