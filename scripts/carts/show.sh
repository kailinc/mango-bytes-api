#!/bin/sh
TOKEN='MJ2dnx5bLZ0+g/hY8REbVsc5J0bawPyK0ZdPW2ji3CU=--Pl5iuMZ9oh/BuW4+bh+Jypd2LGDRAZihxeTfNiArqD0='
ID='59a1adb45f8229648451d081'
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
