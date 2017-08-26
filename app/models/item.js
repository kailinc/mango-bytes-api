'use strict'

const mongoose = require('mongoose')

const itemSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  des: {
    type: String,
    required: true
  },
  img: {
    type: String,
    required: true
  },
  type: {
    type: String,
    required: true
  },
  category: {
    type: String,
    required: true
  },
  basePrice: {
    type: Number,
    required: true
  },
  stock: {
    type: Number,
    required: true
  },
  attributes: {
    type: String,
    required: true
  },
  devCred: {
    type: Number,
    required: true
  }
}, {
  timestamps: true,
  toJSON: {
    virtuals: false,
    transform: function (doc, ret, options) {
      return ret
    }
  }
})

const Item = mongoose.model('Item', itemSchema)

module.exports = Item
