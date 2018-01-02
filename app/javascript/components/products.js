import Vue from 'vue/dist/vue.common';

Vue.component('product-row', {
  template: '#product-row',
  props: {
    product: Object
  }
})

Vue.component('price-fields', {
  template: '#price-fields',
  props: {
    product: Object
  }
})

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'));
  var app = new Vue({
    el: '#products',
    data: {
      userId: "",
      products: [],
      product: {
        name: '',
        size: '',
        pricesNumber: 1,
      },
      errors: {},
      currentPage: 0,
      itemsPerPage: 20,
    },
    computed: {
      totalPages: function() {
        return Math.ceil(this.products.length / this.itemsPerPage);
      },
      paginatedProducts: function() {
        if (this.currentPage >= this.totalPages) {
          this.currentPage = this.totalPages
        }
        var index = this.currentPage * this.itemsPerPage
        return this.products.slice(index, index + this.itemsPerPage)
      },
    },
    methods: {
      addPriceFields: function() {
        this.product.pricesNumber += 1;
      },
      sortById: function() {
        const sorted = this.products.sort((a,b) => (a.id < b.id) ? -i : i)
      },
      sortByName: function() {
        this.products.sort((a,b) => {
          if(a.name == b.name) {
            return (a.id < b.id) ? -1 : (a.id > b.id) ? 1 : 0;
            } else {
            return (a.name < b.name) ? -1 : 1;
          }
        })
      },
      sortBySize: function() {
        this.products.sort((a,b) => {
          if(a.size == b.size) {
            return (a.id < b.id) ? -1 : (a.id > b.id) ? 1 : 0;
            } else {
            return (a.size < b.size) ? -1 : 1;
          }
        })
      },
      setPage: function(pageNumber) {
        this.currentPage = pageNumber -1
      },
      setItemPerPage: function() {
        console.log(this.selected)
        // this.itemsPerPage = this.selected;

      }
    }, // end of methods
    mounted: function() {
      var that;
      that = this;
      const user_id = document.getElementById("userId");
      if (user_id) {
        that.userId = user_id.value
        fetch(`users/${that.userId}`)
        .then(response => response.json())
        .then(data => {
          that.products = data.products;
          })
        }
      }
    }) // end of vue instance

})
