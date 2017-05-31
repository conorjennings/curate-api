#!/bin/bash

API="http://localhost:4741"
URL_PATH="/sign-out"

ID="592f117f990eb0d6594c2f70"
TOKEN="2vwuTHY3yhHsBx/YMAeTk6NBgK4Pi244HLOdT8ICmZk=--miYtFaJcH/sTKGEAo0BLainVHDxvkfFvUJqTKr5cWhQ="

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
