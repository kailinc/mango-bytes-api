'use strict'

const mongoose = require('mongoose')

const cartSchema = new mongoose.Schema({
  products: [{
    item_id: mongoose.Schema.Types.ObjectId,
    quantity: Number,
    price: Number
  }],
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
    total += productList[i].price
  }
  return total
})

const Cart = mongoose.model('Cart', cartSchema)

module.exports = Cart
