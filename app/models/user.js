'use strict'

const bcrypt = require('bcrypt')
const mongoose = require('mongoose')
const uniqueValidator = require('mongoose-unique-validator')

const userSchema = new mongoose.Schema({
  firstName: {
    type: String
  },
  lastName: {
    type: String
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
  JavaScript: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  Python: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  C: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  CSS: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  GO: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  HTML: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  Java: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  Ruby: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  Angular: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  React: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  BootStrap: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  Django: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  Ember: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  MongoDB: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  SQL: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  Node: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  Rails: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  SASS: {
    type: Number,
    default: 0,
    min: 0,
    max: 9000
  },
  powers: [{
    name: {
      type: String,
      required: true
    },
    img: {
      type: String,
      required: true
    }
  }],
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
