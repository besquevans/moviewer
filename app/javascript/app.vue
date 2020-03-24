<template>
  <div id="app">
    <v-app>
      <p>{{ message }}</p>
      <film />
    </v-app>
  </div>
</template>

<script>
import film from "./src/components/film.vue";

export default {
  data: function() {
    return {
      message: "Hello Vue!"
    };
  },
  components: {
    film: film
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
