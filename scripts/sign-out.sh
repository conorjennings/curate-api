#!/bin/bash

API="http://localhost:4741"
URL_PATH="/sign-out"

ID="592f117f990eb0d6594c2f70"
TOKEN="XhLqrA1eaobo6boYOZivbRKg3EX/Xyu7YId1WVuCaOE=--Hods7XdTq3UM12wfOYxlElUVxW2YJCSD47NxV2NV4kk="

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
