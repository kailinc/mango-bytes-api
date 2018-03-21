#!/bin/bash
ID='5ab0642f88bb4d094af1778c'
API="http://localhost:4741"
URL_PATH="/users"
TOKEN='FR74AnSFBEghJUL1aMaldVLfiGHirAZzORJ3GRod+TI=--tu29ZsD1JjWdKMJdZeodW37NuRhPlysHA9N+qzav9p8='

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
