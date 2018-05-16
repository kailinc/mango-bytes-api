'use strict'

module.exports = require('lib/wiring/routes')

// create routes

// what to run for `GET /`
.root('root#root')

// standards RESTful routes
.resources('examples')

// users of the app have special requirements
.post('/sign-up', 'users#signup')
.post('/sign-in', 'users#signin')
.delete('/sign-out/:id', 'users#signout')
.patch('/change-password/:id', 'users#changepw')
.patch('/update-user/:id', 'users#update')
.resources('users', { only: ['index', 'show'] })

// routes for items
.get('/items', 'items#index')
.get('/items/:id', 'items#show')
.post('/item', 'items#create')
.delete('/delete-item/:id', 'items#destroy')

// standards RESTful for carts
.resources('carts')
.get('/own-carts/:id', 'carts#indexOwnCart')
.post('/create-cart', 'carts#create')
.patch('/update-cart/:id', 'carts#update')
.delete('/delete-cart/:id', 'carts#destroy')

.get('/charges', 'charges#index')
.post('/charges', 'charges#create')
