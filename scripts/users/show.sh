#!/bin/bash
ID='59a457905a5a88168522c72a'
API="http://localhost:4741"
URL_PATH="/users"
TOKEN='YnqRayHAB2k+1XElFVN9ohnizwY3na9nlasy3xpZmcE=--hQZTNbnzLU1BaWMvXZ9sp9qHgAAV+qbNcok85x2y2uw='

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
