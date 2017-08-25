#!/bin/sh
TOKEN='htAlRPwsY+CaOKoaq6354LYhcy7XvH+aIiiLTioKOyg=--1DM6dWp80+tzNr9MvHDqT97hqzqT4yhkve44tZ3jBq4='
API="http://localhost:4741"
URL_PATH="/items"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
