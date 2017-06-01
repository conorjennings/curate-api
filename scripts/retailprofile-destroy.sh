#!/bin/bash

API="http://localhost:4741"
URL_PATH="/retailprofiles"

TOKEN="VmGwZbqcEzjeZdKeUBSSiCPIemDPB4VVZcAWa533en0=--Ptjjc2iypOpWwhJZgDJOywrG1cJl3UmJZQAa9L0jrRw="
ID="592f1ca4c8a425eda5173fcc"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"

echo
