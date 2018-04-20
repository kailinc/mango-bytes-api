#!/bin/sh
TOKEN='00Qa4+FNZ6qIQdVlh1G2zh4741/zwEEsxghmlPBlmOQ=--J8DOC4lwr7g8yMFDqK379O+hC5a76j2pdSlVXPUzyPM='
ID='5ad4b31852bb4327aa952e6c'
API="http://localhost:4741"
URL_PATH="/own-carts"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
