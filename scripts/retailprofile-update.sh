#!/bin/bash

API="http://localhost:4741"
URL_PATH="/retailprofiles"

TOKEN="cBZugHM1QERwJdYYHRkoK/C7K/z3f8WCUgGBgVnDHBw=--H9EVfM8B/6hbUyOCOr5x+wDNdxmkP03tsM8SQzNcpH4="
ID="592f1d602b626bede31a023d"

NAME="Elizabeth Suzann - Edit"
URL="https://editedurl.com/"
VEGAN="true"
SUSTAINABLE="false"
SLOW="false"
INDEPENDENT="false"
NOTES="Editing this note."

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
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
