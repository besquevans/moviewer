<template>
  <div class="film-item">
    <div class="film" :style="imgShow"></div>
    <h3>{{title}}</h3>

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
    url: {
      type: String,
      default: "http://via.placeholder.com/200x200"
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
<style scoped>
.film-item {
  width: 200px;
  height: auto;
}
.film {
  width: 200px;
  height: 200px;
  border-radius: 12px;
  background-color: #f0f0f0;
  display: flex;
  justify-content: center;
  align-items: center;
}
.film img {
  width: 100%;
}
.film span {
  font-size: 24px;
  color: #c0c0c0;
}
h3 {
  font-size: 24px;
  text-align: center;
}
p {
  font-size: 15px;
  text-align: center;
  height: 50px;
  overflow: hidden;
}
.film-btn-container {
  width: 160px;
  border: 1px solid #c0c0c0;
  border-radius: 6px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.film-btn-container button {
  height: 24px;
  width: 100%;
  font-size: 15px;
  border: none;
  background-color: transparent;
}
.film-btn-container button:hover {
  cursor: pointer;
  background-color: #f0f0f0;
}
.film-btn-container button:nth-child(1) {
  border-right: 1px solid #c0c0c0;
}
.film-btn-container button:nth-child(2) {
  border-right: 1px solid #c0c0c0;
}
</style>