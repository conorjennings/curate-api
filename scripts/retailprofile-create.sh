#!/bin/bash

API="http://localhost:4741"
URL_PATH="/retailprofiles"

TOKEN="sMleYjPn9qPDYnqr4g7CgYQNRc3eyyqYwjWj81sBHWs=--UaoqNHD9bHyQ12pRl86+oypvLruKsAV3GIyWk8wLWks="
NAME="Elizabeth Suzann"
URL="https://elizabethsuzann.com/"
VEGAN="false"
SUSTAINABLE="true"
SLOW="true"
INDEPENDENT="true"
NOTES="I really like the shoes here."

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "retailprofile": {
      "name": "'"${NAME}"'",
      "siteUrl": "'"${URL}"'",
      "vegan": "'"${VEGAN}"'",
      "sustainable": "'"${SUSTAINABLE}"'",
      "slow": "'"${SLOW}"'",
      "independent": "'"${INDEPENDENT}"'",
      "notes": "'"${NOTES}"'"
    }
  }'

echo
