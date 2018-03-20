#!/bin/sh
TOKEN='htAlRPwsY+CaOKoaq6354LYy7XvH+aIiiLTioKOyg=--1DM6dWp80+tzNr9MvHDqT97hqzqT4yhkve44tZ3jBq4='
ID='59a197c79f399e9a7f9725af'
API="http://localhost:4741"
URL_PATH="/items"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
