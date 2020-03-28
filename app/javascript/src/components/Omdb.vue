<template>
  <div id="search-result">
    <div v-for="film in films" :key="film.Title">
      <h1>Title: {{ film.Title }}</h1>
      <h2>Year: {{ film.Year }}</h2>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Films",
  data() {
    return {
      films: null
    };
  },
  mounted() {
    axios
      .get("https://www.omdbapi.com/?apikey=80492f69&s=iron+man")
      .then(response => (this.films = response.data.Search));
  }
};
</script>