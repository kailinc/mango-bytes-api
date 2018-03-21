#!/bin/bash
FIRSTNAME='happy'
LASTNAME='wow'
CODERNAME='dam'
FOURSCREENS=true
DEVCRED=99

TOKEN='FR74AnSFBEghJUL1aMaldVLfiGHirAZzORJ3GRod+TI=--tu29ZsD1JjWdKMJdZeodW37NuRhPlysHA9N+qzav9p8='
ID='5ab0642f88bb4d094af1778c'

API="http://localhost:4741"
URL_PATH="/update-user"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "skills": [{"name": "Python", "level": "199"}]
    }
  }'

echo
