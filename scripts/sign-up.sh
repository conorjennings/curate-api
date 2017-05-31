#!/bin/bash

# Added the credentials so the script can be run directly from command line without cutting/pasting data.

API="http://localhost:4741"
URL_PATH="/sign-up"

EMAIL="danielle"
PASSWORD="danielle"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'

echo
