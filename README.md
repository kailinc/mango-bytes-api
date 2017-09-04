## Links to your client-side application, deployed client app, and deployed api.

- Client Repository: https://github.com/kailinc/mango-bytes-client-backup
- Deployed API: https://damp-hamlet-57878.herokuapp.com/
- Deployed Application:https://kailinc.github.io/mango-bytes-client-backup/

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

- Amazon Web Services
- Heroku
- Mongoose
- Node
- Express
- Nodemon

## A couple paragraphs about the general approach you took

At the start of the project, I thought the backend is the most crucial part, so
I spent the first 2 days of project week working on the backend. I had a very good
idea how I wanted my data structure to be. I drew it on a whiteboard and planned it
very carefully.

After that I would start coding. The route I used for developing each resource was
to work on the controller, the routes, and then the schema. Then I would test it with
scripts. If the scripts work out fine, I would go on to work on the next resource.
For User Resource, I just needed to edit the schema a bit to support my client side
application. I also added a controller for updating a user's profile.

Next I worked on the Items Resource. This didn't take very long because I just
needed index and show actions. I want to be the only one creating items for the app,
so I removed create actions to prevent internet trolls. I should have set up special
admin permissions, which would make it easier for me to create items. Currently, I am
just bulk loading data into Heroku.

For carts, it was standard. I wanted all the CRUD actions. There was a nested schema
here and in User Resource that I was able to figure out because the Mongoose Docs
were pretty straight forward for easy tasks. I also had to reference Example resource
to ensure user ownership.

## Descriptions of any unsolved problems or major hurdles you had to overcome

### Hurdle

Nested Schema is a challenge in this project. I never set it up before. I
referenced the Mongoose Docs and a few examples on Stack Overflow to set it up. Once
I set it up, it was relatively simple to set up more nested Schemas. I set up nested
schemas in Carts Resource for products attribute, which was an array of objects (items).
I also set it up in User's Resource for skills attribute and powers attribute. These
attributes were very similiar to products attribute.

### Unsolved Problem

For Carts Resource, products attribute, I wanted to set up so that each item Object
in products array would show the full information of that item. I followed a guide
and was able to set up href to Item Resource. However, I was not able to get the full
information of items when I set a GET request for a cart. This might have been because
I needed to set it up so that an item has reference to every cart is in. This is gross.
