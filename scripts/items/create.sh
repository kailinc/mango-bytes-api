#!/bin/bash
NAME='Ruby'
DEVCRED=100
BASEPRICE=5
DES='Ruby is a dynamic, reflective, object-oriented, general-purpose programming language. It was designed and developed in the mid-1990s by Yukihiro Matsumoto in Japan. According to the creator, Ruby was influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/ruby.png'

API="http://localhost:4741"
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
        {
          "name": "Ruby",
          "exp": "3"
        }
      ],
      "tags": [ "ruby", "skills"],
      "des": "'"${DES}"'",
      "img": "'"${IMG}"'"
    }
  }'

echo
