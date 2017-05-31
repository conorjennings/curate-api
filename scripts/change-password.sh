#!/bin/bash

API="http://localhost:4741"
URL_PATH="/change-password"

TOKEN="2vwuTHY3yhHsBx/YMAeTk6NBgK4Pi244HLOdT8ICmZk=--miYtFaJcH/sTKGEAo0BLainVHDxvkfFvUJqTKr5cWhQ="
OLDPW="danielle"
NEWPW="alex"
ID="592f117f990eb0d6594c2f70"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'

echo
