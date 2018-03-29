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
  discount: {
    type: Number,
    default: 0,
    min: 0
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

cartSchema.virtual('productTotal').get(function length () {
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

cartSchema.virtual('tax').get(function length () {
  return this.productTotal * 0.06
})

cartSchema.virtual('totalPrice').get(function length () {
  return (this.productTotal + this.tax) - this.discount
})

cartSchema.virtual('skills').get(function length () {
  const skills = []
  for (let i = 0; i < this.products.length; i++) {
    for (let j = 0; j < this.products[i].attributes.length; j++) {
      const skillName = this.products[i].attributes[j].name
      const skillExp = this.products[i].attributes[j].exp
      const quantity = this.products[i].quantity
      const pos = getAttPos(skills, skillName)
      if (pos > -1) {
        skills[pos].exp += (skillExp * quantity)
      } else {
        const newSkill = {
          name: skillName,
          exp: skillExp * quantity
        }
        skills.push(newSkill)
      }
    }
  }
  return skills
})

const getAttPos = function (skills, skillName) {
  for (let i = 0; i < skills.length; i++) {
    if (skills[i].name === skillName) {
      return i
    }
  }
  return -1
}

const Cart = mongoose.model('Cart', cartSchema)

module.exports = Cart
