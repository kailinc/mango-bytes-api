#!/bin/bash
NAME='Whiteboard'
DEVCRED=100000
BASEPRICE=1499
DES='Whiteboards made a HUGE comeback. In kindergarden, you drew cute pictures to impress your teachers. Now you write complicated, scalable algorithms that uses cloud computing, blockchain technology, virtual reality, artificial intelligence on these white plastic boards.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/miscellaneous/whiteboard.png'
CAT='misc'
API="https://damp-hamlet-57878.herokuapp.com/"
URL_PATH="item"

curl "${API}/${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "name": "'"${NAME}"'",
      "devCred": "'"${DEVCRED}"'",
      "basePrice": "'"${BASEPRICE}"'",
      "attributes": [
      ],
      "category": "'"${CAT}"'",
      "des": "'"${DES}"'",
      "img": "'"${IMG}"'"
    }
  }'

echo
