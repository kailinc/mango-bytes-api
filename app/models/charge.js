'use strict'

const mongoose = require('mongoose')

// declaration of schema
const chargeSchema = new mongoose.Schema({
  stripeToken: {
    type: String,
    required: true
  },
  amount: {
    type: Number,
    required: true
  },
  currency: {
    type: String,
    required: true
  },
  cartId: {
    type: String,
    required: true
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

chargeSchema.virtual('length').get(function length () {
  return this.text.length
})

const Charge = mongoose.model('Charge', chargeSchema)

module.exports = Charge
