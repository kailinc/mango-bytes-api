#!/bin/bash
TOKEN='JDzqmZd/iv/hQGgV+0/aaW0G76kLAcS/+brVnTqjpu8=--UASWMoB56PP+XqD1U97sIQ1Kl3XrTE2NFBecAwkav+o='
ID='5ab26b262d77233e9cfa9fed'

API="http://localhost:4741"
URL_PATH="/users"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
