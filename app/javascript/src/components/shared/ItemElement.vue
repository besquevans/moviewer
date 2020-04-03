<template>
  <div class="film-item">
    <div class="film" :style="imgShow"></div>
    <p>{{ id }}</p>
    <h3>{{ title }}</h3>
    <p>{{ year }}</p>
    <p>{{ intro }}</p>
    <div class="film-btn-container" v-if="isLogin">
      <v-btn @click="handleShow">Show</v-btn>
      <v-btn @click="handleEdit">Edit</v-btn>
      <v-btn @click="handleDelete">Destory</v-btn>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    isLogin: {
      type: Boolean,
      default: true
    },
    id: {
      type: Number,
      default: 1
    },
    title: {
      type: String,
      default: "title"
    },
    year: {
      type: Number,
      default: 2087
    },
    url: {
      type: String,
      default: "http://via.placeholder.com/200x200"
    },
    intro: {
      type: String,
      default: "default intro"
    }
  },
  methods: {
    handleShow: function() {
      this.$router.push("/films/" + this.id);
      console.log("show");
    },
    handleEdit: function() {
      this.$router.push("/films/edit/" + this.id);
      console.log("edit");
    },
    handleDelete: function() {
      console.log("destroy");
    }
  },
  computed: {
    imgShow: function() {
      return {
        background: "url(" + this.url + ") no-repeat center",
        backgroundSize: "cover"
      };
    }
  }
};
</script>
