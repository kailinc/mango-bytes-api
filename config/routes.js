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
.patch('/update-user/:id', 'users#updateuser')
.resources('users', { only: ['index', 'show'] })

// routes for items
.get('/items', 'items#index')
.get('/items/:id', 'items#show')

// standards RESTful for carts
.get('/carts', 'carts#index')
.get('/carts/:id', 'carts#show')
.post('/carts', 'carts#create')
.patch('/carts/:id', 'carts#update')
