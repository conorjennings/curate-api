#!/bin/bash

API="http://localhost:4741"
URL_PATH="/retailprofiles"

TOKEN="RqpLc2Hm6NjJwRDxfhGplXls60YQCqmaHl8f0JUrMTY=--jY0noGJZjXcBHng+UGW/3h6QgQQ/rWiMO2Hry9U2mMs="

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}" \

echo
