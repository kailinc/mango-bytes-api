#!/bin/bash
FIRSTNAME='happy'
LASTNAME='wow'
CODERNAME='dam'
FOURSCREENS=true
DEVCRED=99
JAVA=99
PYTHON=99
ANGULAR=99
BOOTSTRAP=99
C=99
CSHARP=99
CPLUSPLUS=99
CSS=99
DJANGO=99
EMBER=99
GO=99
HTML=99
MONGODB=99
MYSQL=99
NODE=99
RAILS=99
REACT=99
RUBY=99
JAVASCRIPT=99
WALKINGGOOGLE=true
DOCMASTER=true
BUGSLAYER=true
STEADYHANDS=true
FIREFINGERS=true
COFFEEATM=true
SASS=99


TOKEN='htAlRPwsY+CaOKoaq6354LYhcy7XvH+aIiiLTioKOyg=--1DM6dWp80+tzNr9MvHDqT97hqzqT4yhkve44tZ3jBq4='
ID='59a062420a980b1b7cd0b45a'

API="http://localhost:4741"
URL_PATH="/update-user"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "firstName": "'"${FIRSTNAME}"'",
      "lastName": "'"${LASTNAME}"'",
      "coderName": "'"${CODERNAME}"'",
      "devCred": "'"${DEVCRED}"'",
      "java": "'"${JAVA}"'",
      "javaScript": "'"${JAVASCRIPT}"'",
      "python": "'"${PYTHON}"'",
      "angular": "'"${ANGULAR}"'",
      "bootStrap": "'"${BOOTSTRAP}"'",
      "c": "'"${C}"'",
      "cSharp": "'"${CSHARP}"'",
      "cPlusPlus": "'"${CPLUSPLUS}"'",
      "css": "'"${CSS}"'",
      "django": "'"${DJANGO}"'",
      "ember": "'"${EMBER}"'",
      "go": "'"${GO}"'",
      "html": "'"${HTML}"'",
      "mongoDB": "'"${MONGODB}"'",
      "mySQL": "'"${MYSQL}"'",
      "node": "'"${NODE}"'",
      "rails": "'"${RAILS}"'",
      "react": "'"${REACT}"'",
      "ruby": "'"${RUBY}"'",
      "walkingGoogle": "'"${WALKINGGOOGLE}"'",
      "docMaster": "'"${DOCMASTER}"'",
      "bugSlayer": "'"${BUGSLAYER}"'",
      "steadyHands": "'"${STEADYHANDS}"'",
      "fireFingers": "'"${FIREFINGERS}"'",
      "coffeeATM": "'"${COFFEEATM}"'",
      "fourScreens": "'"${FOURSCREENS}"'",
      "sass": "'"${SASS}"'"

    }
  }'

echo
