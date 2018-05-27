'use strict'

const mongoose = require('mongoose')

const cartSchema = new mongoose.Schema({
  items: [{
    item_id: {
      type: mongoose.Schema.Types.ObjectId,
      required: true,
      ref: 'Item'
    },
    quantity: {
      type: Number,
      required: true
    },
    name: {
      type: String,
      required: true
    },
    devCred: {
      type: Number,
      required: true,
      min: 0
    },
    basePrice: {
      type: Number,
      required: true,
      min: 0
    },
    img: {
      type: String,
      required: true
    },
    attributes: [
      {
        name: String,
        exp: {
          type: Number,
          min: 0,
          max: 10
        }
      }
    ]
  }],
  isPaid: {
    type: Boolean,
    default: false
  },
  attributes: {},
  finalPrice: 0,
  charge: String,
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

cartSchema.virtual('productTotal').get(function length () {
  const items = this.items
  let total = 0
  for (let i = 0; i < items.length; i++) {
    total += (items[i].basePrice * items[i].quantity)
  }
  return total
})

const Cart = mongoose.model('Cart', cartSchema)

module.exports = Cart
