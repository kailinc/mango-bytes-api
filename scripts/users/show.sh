#!/bin/bash
ID='5ab05e8ab3b69a0625dd0a95'
API="http://localhost:4741"
URL_PATH="/users"
TOKEN='LLOIIJJ6ojLGwYTiSVLJ1fylFSSKKK54/48vEw2vP6s=--jaCC3QiEbsNd1Fmz14TsVCKr6uIaq0oLhmcDNXwfJJQ='

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
