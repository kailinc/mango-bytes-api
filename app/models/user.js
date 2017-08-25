'use strict'

const bcrypt = require('bcrypt')
const mongoose = require('mongoose')
const uniqueValidator = require('mongoose-unique-validator')

const userSchema = new mongoose.Schema({
  firstName: {
    type: String,
    required: true
  },
  lastName: {
    type: String,
    required: true
  },
  coderName: {
    type: String
  },
  devCred: {
    type: Number,
    default: 0
  },
  fourScreens: {
    type: Boolean,
    default: false
  },
  javaScript: {
    type: Number,
    default: 0
  },
  python: {
    type: Number,
    default: 0
  },
  angular: {
    type: Number,
    default: 0
  },
  bootStrap: {
    type: Number,
    default: 0
  },
  c: {
    type: Number,
    default: 0
  },
  cSharp: {
    type: Number,
    default: 0
  },
  cPlusPlus: {
    type: Number,
    default: 0
  },
  css: {
    type: Number,
    default: 0
  },
  django: {
    type: Number,
    default: 0
  },
  ember: {
    type: Number,
    default: 0
  },
  go: {
    type: Number,
    default: 0
  },
  html: {
    type: Number,
    default: 0
  },
  java: {
    type: Number,
    default: 0
  },
  mongoDB: {
    type: Number,
    default: 0
  },
  mySQL: {
    type: Number,
    default: 0
  },
  node: {
    type: Number,
    default: 0
  },
  rails: {
    type: Number,
    default: 0
  },
  react: {
    type: Number,
    default: 0
  },
  ruby: {
    type: Number,
    default: 0
  },
  sass: {
    type: Number,
    default: 0
  },
  walkingGoogle: {
    type: Boolean,
    default: false
  },
  docMaster: {
    type: Boolean,
    default: false
  },
  bugSlayer: {
    type: Boolean,
    default: false
  },
  steadyHands: {
    type: Boolean,
    default: false
  },
  fireFingers: {
    type: Boolean,
    default: false
  },
  coffeeATM: {
    type: Boolean,
    default: false
  },
  email: {
    type: String,
    unique: true,
    required: true
  },
  token: {
    type: String,
    required: true
  },
  passwordDigest: String
}, {
  timestamps: true,
  toJSON: {
    virtuals: true,
    transform: function (doc, pojoUser) {
      // remove sensitive data from every user document
      delete pojoUser.token
      delete pojoUser.passwordDigest
      return pojoUser
    }
  },
  toObject: {
    virtuals: true
  }
})

userSchema.plugin(uniqueValidator)

userSchema.methods.comparePassword = function (password) {
  const _this = this

  return new Promise((resolve, reject) =>
    bcrypt.compare(password, _this.passwordDigest, (err, data) =>
        err ? reject(err) : data ? resolve(data) : reject(new Error('Not Authorized')))
    ).then(() => _this)
}

userSchema.virtual('password').set(function (password) {
  this._password = password
})

userSchema.pre('save', function (next) {
  const _this = this

  if (!_this._password) {
    return next()
  }

  new Promise((resolve, reject) =>
    bcrypt.genSalt(null, (err, salt) =>
        err ? reject(err) : resolve(salt))
  ).then((salt) =>
    new Promise((resolve, reject) =>
      bcrypt.hash(_this._password, salt, (err, data) =>
        err ? reject(err) : resolve(data)))
  ).then((digest) => {
    _this.passwordDigest = digest
    next()
  }).catch((error) => {
    next(error)
  })
})

userSchema.methods.setPassword = function (password) {
  const _this = this

  return new Promise((resolve, reject) =>
    bcrypt.genSalt(null, (err, salt) =>
        err ? reject(err) : resolve(salt))
  ).then((salt) =>
    new Promise((resolve, reject) =>
      bcrypt.hash(password, salt, (err, data) =>
        err ? reject(err) : resolve(data)))
  ).then((digest) => {
    _this.passwordDigest = digest
    return _this.save()
  })
}

const User = mongoose.model('User', userSchema)

module.exports = User
