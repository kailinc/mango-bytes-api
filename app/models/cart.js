'use strict'

const mongoose = require('mongoose')

const cartSchema = new mongoose.Schema({
  products: [{
    item: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Item',
      required: true
    },
    quantity: {
      type: Number,
      min: 0
    },
    name: {
      type: String,
      required: true
    },
    img: {
      type: String,
      required: true
    },
    attributes: {
      type: String,
      required: true
    },
    basePrice: {
      type: String,
      required: true
    },
    devCred: {
      type: String,
      required: true
    }
  }],
  isPaid: {
    type: Boolean,
    default: false
  },
  _owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}, {
  timestamps: true,
  toJSON: {
    virtuals: true,
    transform: function (doc, ret, options) {
      const userId = (options.user && options.user._id) || false
      ret.editable = userId && userId.equals(doc._owner)
      return ret
    }
  }
})

cartSchema.virtual('totalPrice').get(function length () {
  const productList = this.products
  let total = 0
  for (let i = 0; i < productList.length; i++) {
    total += (productList[i].basePrice * productList[i].quantity)
  }
  return total
})

cartSchema.virtual('totalDevCred').get(function length () {
  const productList = this.products
  let total = 0
  for (let i = 0; i < productList.length; i++) {
    total += (productList[i].devCred * productList[i].quantity)
  }
  return total
})

const Cart = mongoose.model('Cart', cartSchema)

module.exports = Cart
