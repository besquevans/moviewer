<template>
  <div>
    <v-btn @click="handleNew">New Film</v-btn>

    <div class="item-list" v-for="film in films">
      <itemElement />
    </div>
  </div>
</template>

<script>
import ItemElement from "../shared/ItemElement.vue";
import Axios from "axios";

export default {
  data: function() {
    return {
      isLogin: true,
      films: films
    };
  },
  components: {
    ItemElement: ItemElement
  },
  methods: {
    handleNew: function() {
      this.$router.push("/films/new");
      console.log("New");
    }
  },
  mounted() {
    axios
      .get("http://localhost: 3000")
      .then(response => (this.films = response));
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