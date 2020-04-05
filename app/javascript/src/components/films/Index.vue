<template>
  <div>
    <v-btn @click="handleNew">New Film</v-btn>
    <router-link to="/films/new">New</router-link>
    <div class="item-list" v-for="(film, index) in films">
      <ItemElement
        :id="film.id"
        :title="film.title"
        :year="film.year"
        :intro="film.intro"
        @destroy-item="handleDestroyItem(index)"
      />
    </div>
  </div>
</template>

<script>
import ItemElement from "../shared/ItemElement.vue";
import axios from "axios";

export default {
  data() {
    return {
      isLogin: true,
      films: []
    };
  },
  components: {
    ItemElement: ItemElement
  },
  methods: {
    handleNew: function() {
      this.$router.push("/films/new");
      console.log("New");
    },
    ///監聽刪除事件更新畫面
    handleDestroyItem: function(index) {
      console.log("delete film" + index);
      this.films.splice(index, 1);
    }
  },
  mounted() {
    axios
      .get("/api/v1/films")
      .then(response => (this.films = response.data))
      .catch(error => console.log(error));
  }
};
</script>


<style scoped>
.container {
  max-width: 1440px;
  margin: 100px auto;
  display: flex;
  flex-wrap: wrap;
}
</style>