[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# curate-api

Find the repo for the curate. front end client [here](https://github.com/danielleletarte/curate-client).

Find the deployed curate. front end client [here](https://fast-ocean-99929.herokuapp.com).

### Entity Relationship Diagram

A copy of the ERD can be found [here](img/ERD.JPG).<br>

## API

This API helps users with an interest in vegan and sustainable fashion manage keep track of their favorite sources. A user can create create retail profiles, track whether the retailer independent and whether they follow vegan, slow, or sustainable practices. A user can also track any important notes they want to remember about the retailer.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:4741/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:4741/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH http://localhost:4741/change-password/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl --include --request DELETE http://localhost:4741/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl --include --request GET http://localhost:4741/users \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "another@example.email"
    },
    {
      "id": 1,
      "email": "an@example.email"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "another@example.email"
  }
}
```

### User Actions

#### index /retailprofiles

The index action is a GET that retrieves all the retail profiles associated with a user. The response body will contain JSON containing an array of retail profiles, e.g.:



Request:

```sh
API="http://localhost:4741"
URL_PATH="/retailprofiles"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}" \
```

```sh
TOKEN="aqPhrVctPxX+kg21ColVUMoNYxfIhA79zVJQq5ZqCsE=--1Mw119XiPrAMD9dpArKrcXJqGMlcy6g5uBraKNtFf5s="
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "retailprofiles": [
  {
    "id": 1,
    "name": "this is a test",
    "siteUrl": "www.test.com",
    "notes": "cool shop",
    "vegan": true,
    "slow:" false,
    "sustainable": true,
    "independent": true
  }
  {
    "id": 2,
    "name": "this is a test",
    "siteUrl": "www.test.com",
    "notes": "cool shop",
    "vegan": true,
    "slow:" false,
    "sustainable": true,
    "independent": true
  }
 ]
}
```
#### show /retailprofiles/:id

The show action is a GET specifing the id of the retail profile to retrieve. If the request is successful the status will be 200, OK, and the response body will contain JSON for the idea requested.

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/retailprofiles/$ID"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json"
```

```sh
ID=2 TOKEN=BAhJIiVlODkyNTczNzYzYmVkN2RmOWNlYWM1MjAyZDhmMDI2NgY6BkVG--23303c36d71984539b1c7c76dd96acaeb37c437c
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "retailprofile": {
    "id": 2,
    "name": "this is a test",
    "siteUrl": "www.test.com",
    "notes": "cool shop",
    "vegan": true,
    "slow:" false,
    "sustainable": true,
    "independent": true
  }
}
```
#### create /retailprofiles

The create action expects a POST with an empty body (e.g '' or '{}' if JSON). If the request is successful, the response will have an HTTP Status of 201 Created, and the body will contain JSON of the created retail profile set to the associated user.

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/retailprofiles"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
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
```

```sh
TOKEN="dz6YduYcdHpBIqG8uai9xUXIYNoZV1x6oxFhlileaPg=--NC2w1h0YMcb9B5H1oRwviehzw4a7AkXpVeiL0R2PzwA="
NAME="Moo Shoes is vegan"
URL="https://mooshoes.com/"
VEGAN="true"
SUSTAINABLE="true"
SLOW="true"
INDEPENDENT="true"
NOTES="shoes!"

```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "retailprofile": {
    "id": 2,
    "name": "this is a test",
    "siteUrl": "www.test.com",
    "notes": "cool shop",
    "vegan": true,
    "slow:" false,
    "sustainable": true,
    "independent": true
  }
}
```
#### update /retailprofiles/:id

This update action expects an empty (e.g '' or '{}' if JSON) PATCH to an existing idea.

If the request is successful, the response will have an HTTP Status of 200 OK, and the body will be JSON containing the updated retail profile.

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/retailprofiles/$ID"
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
```

```sh
TOKEN="dz6YduYcdHpBIqG8uai9xUXIYNoZV1x6oxFhlileaPg=--NC2w1h0YMcb9B5H1oRwviehzw4a7AkXpVeiL0R2PzwA="
NAME=""
URL="https://mooshoes.com/"
VEGAN="true"
SUSTAINABLE="true"
SLOW="true"
INDEPENDENT="true"
NOTES="shoes!"
```

Response:

```md
HTTP/1.1 204 No Content
```
#### destroy /retailprofiles/:id

The destroy action is a DELETE request specifing the id of the retail profile to delete. If the request is successful the status will be 204 No Content.

Request:

```sh
API="http://localhost:4741"
URL_PATH="/retailprofiles"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN="VmGwZbqcEzjeZdKeUBSSiCPIemDPB4VVZcAWa533en0=--Ptjjc2iypOpWwhJZgDJOywrG1cJl3UmJZQAa9L0jrRw="
ID="592f1ca4c8a425eda5173fcc"
```

Response:

```md
HTTP/1.1 204 No Content
```

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
