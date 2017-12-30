import Vue from 'vue'

Vue.component('product-row', {
  template: '#product-row',
  props: {
    product: Object
  }
})


document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'));
  var app = new Vue({
    el: '#products',
    data: {
      message: "coucou",
      products: [],
      product: {
        name: '',
        size: '',
        user: ''
      },
      errors: {}
    },
    methods: {
    addProduct: function () {
      var that = this;
      $.ajax({
        method: 'POST',
        data: {
          product: that.product,
        },
        url: '/products.json',
        success: function(res) {
          that.errors = {}
          that.products.push(res);
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
          }
       })
      },
    sort_id: function() {
      this.products.sort((a,b) => {
        a.id > b.id ? -1 : 1;
        })
      },
    sort_name: function() {
      this.products.sort((a,b) => {
        a.name > b.name ? -1 : 1
       })
      },
    sort_size: function() {
      this.products.sort((a,b) => {
        a.size > b.size ? -1 : 1
       })
      }
    },
    ready: function() {
      var that;
      that = this;
      $.ajax({
        url: '/products.json',
        success: function(res) {
          that.products = res;
        }
      });
    },

})

  console.log(app.message)
})
