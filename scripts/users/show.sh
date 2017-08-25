#!/bin/bash
ID='59a062420a980b1b7cd0b45a'
API="http://localhost:4741"
URL_PATH="/users"
TOKEN='htAlRPwsY+CaOKoaq6354LYhcy7XvH+aIiiLTioKOyg=--1DM6dWp80+tzNr9MvHDqT97hqzqT4yhkve44tZ3jBq4='

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
