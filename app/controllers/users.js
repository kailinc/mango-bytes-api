'use strict'

const debug = require('debug')('mango-bytes-api:users')

const controller = require('lib/wiring/controller')
const models = require('app/models')
const User = models.user

const crypto = require('crypto')

const authenticate = require('./concerns/authenticate')

const HttpError = require('lib/wiring/errors/http-error')

const MessageVerifier = require('lib/wiring/message-verifier')

const encodeToken = (token) => {
  const mv = new MessageVerifier('secure-token', process.env.SECRET_KEY)
  return mv.generate(token)
}

const getToken = () =>
  new Promise((resolve, reject) =>
    crypto.randomBytes(16, (err, data) =>
      err ? reject(err) : resolve(data.toString('base64'))
    )
  )

const index = (req, res, next) => {
  User.find({})
    .then(users => res.json({ users }))
    .catch(next)
}

const show = (req, res, next) => {
  User.findById(req.params.id)
    .then(user => user ? res.json({ user }) : next())
    .catch(next)
}

const makeErrorHandler = (res, next) =>
  error =>
    error && error.name && error.name === 'ValidationError'
      ? res.status(400).json({ error })
    : next(error)

// edit to incorporate schemas
const signup = (req, res, next) => {
  const credentials = req.body.credentials
  const user = {
    firstName: credentials.firstName,
    lastName: credentials.lastName,
    coderName: credentials.coderName,
    email: credentials.email,
    password: credentials.password
  }
  getToken()
    .then(token => {
      user.token = token
    })
    .then(() =>
      new User(user).save())
    .then(user =>
      res.status(201).json({ user }))
    .catch(makeErrorHandler(res, next))
}

const signin = (req, res, next) => {
  const credentials = req.body.credentials
  const search = { email: credentials.email }
  User.findOne(search)
    .then(user =>
      user ? user.comparePassword(credentials.password)
            : Promise.reject(new HttpError(404)))
    .then(user =>
      getToken().then(token => {
        user.token = token
        return user.save()
      }))
    .then(user => {
      user = user.toObject()
      delete user.passwordDigest
      user.token = encodeToken(user.token)
      res.json({ user })
    })
    .catch(makeErrorHandler(res, next))
}

const signout = (req, res, next) => {
  getToken().then(token =>
    User.findOneAndUpdate({
      _id: req.params.id,
      token: req.user.token
    }, {
      token
    })
  ).then((user) =>
    user ? res.sendStatus(204) : next()
  ).catch(next)
}

const updateuser = (req, res, next) => {
  const credentials = req.body.credentials
  User.findOne({
    _id: req.params.id,
    token: req.user.token
  }).then(user => {
    user.firstName = credentials.firstName
    user.lastName = credentials.lastName
    user.coderName = credentials.coderName
    user.devCred = credentials.devCred
    user.fourScreens = credentials.fourScreens
    user.javaScript = credentials.javaScript
    user.python = credentials.python
    user.angular = credentials.angular
    user.bootStrap = credentials.bootStrap
    user.c = credentials.c
    user.cSharp = credentials.cSharp
    user.cPlusPlus = credentials.cPlusPlus
    user.css = credentials.css
    user.django = credentials.django
    user.ember = credentials.ember
    user.go = credentials.go
    user.html = credentials.html
    user.java = credentials.java
    user.mongoDB = credentials.mongoDB
    user.mySQL = credentials.mySQL
    user.node = credentials.node
    user.rails = credentials.rails
    user.react = credentials.react
    user.ruby = credentials.ruby
    user.sass = credentials.sass
    user.walkingGoogle = credentials.walkingGoogle
    user.docMaster = credentials.docMaster
    user.bugSlayer = credentials.bugSlayer
    user.steadyHands = credentials.steadyHands
    user.fireFingers = credentials.fireFingers
    user.coffeeATM = credentials.coffeeATM
    return user.save()
  }).then((/* user */) =>
    res.sendStatus(204)
  ).catch(makeErrorHandler(res, next))
}

const changepw = (req, res, next) => {
  User.findOne({
    _id: req.params.id,
    token: req.user.token
  }).then(user =>
    user ? user.comparePassword(req.body.passwords.old)
      : Promise.reject(new HttpError(404))
  ).then(user => {
    user.password = req.body.passwords.new
    return user.save()
  }).then((/* user */) =>
    res.sendStatus(204)
  ).catch(makeErrorHandler(res, next))
}

module.exports = controller({
  index,
  show,
  signup,
  signin,
  signout,
  changepw,
  updateuser
}, { before: [
  { method: authenticate, except: ['signup', 'signin'] }
] })