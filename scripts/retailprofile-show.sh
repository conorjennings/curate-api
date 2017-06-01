#!/bin/bash

API="http://localhost:4741"
URL_PATH="/retailprofiles"

TOKEN="QGoBhtNxtYi8FA5pkhNOfmi9wWk57yGr1wkYIUyVVAU=--ddIm+wCszplKBqI3NAXJ7XaCJbVuZoXG0d1/6t5tJgw="
ID="592f1ca4c8a425eda5173fcc"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
