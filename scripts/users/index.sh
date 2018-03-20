#!/bin/bash
TOKEN=gEq6V3dd1u6KLuVl2EebFfBom1E18k04LREiM8ulJdQ=--WGIMjY2nTnPeGF2zBZAtq0YO4bz0eMVRE02Y8z6Kr48=
API="http://localhost:4741"
URL_PATH="/users"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
