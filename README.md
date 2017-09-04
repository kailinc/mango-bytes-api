## Links to your client-side application, deployed client app, and deployed api.

Client Repository: https://github.com/kailinc/mango-bytes-client-backup
Deployed API: https://damp-hamlet-57878.herokuapp.com/
Deployed Application:https://kailinc.github.io/mango-bytes-client-backup/

## An ERD

https://drive.google.com/drive/folders/0Bxg3M0KoMGmASHZzeDJic3VOUnc?usp=sharing

## A list of your API routes

| Verb   | URI Pattern            | Controller#Action      |
|--------|------------------------|------------------------|
| POST   | `/sign-up`             | `users#signup`         |
| POST   | `/sign-in`             | `users#signin`         |
| PATCH  | `/change-password/:id` | `users#changepw`       |
| PATCH  | `/update-user/:id`     | `users#updateuser`     |
| DELETE | `/sign-out/:id`        | `users#signout`        |
| GET    | `/items`               | `items#index`          |
| GET    | `/items/:id`           | `items#show`           |
| GET    | `/carts`               | `carts#index`          |
| GET    | `/carts/:id`           | `carts#show`           |
| POST   | `/carts`               | `carts#create`         |
| PATCH  | `/carts/:id`           | `carts#update`         |
| DELETE | `/carts/:id`           | `carts#destroy`        |

## Installation instructions for any dependencies

1. npm install (express, mongoose)

## Explanations of the technologies used



## A couple paragraphs about the general approach you took



## Descriptions of any unsolved problems or major hurdles you had to overcome
