<template>
  <v-container>
    <h1>New Film</h1>
    <ImgDisplay />
    <FilmForm @film-form-submit="postCreate" />
  </v-container>
</template>

<script>
import ImgDisplay from "../shared/ImgDisplay.vue";
import FilmForm from "../shared/FilmForm.vue";
import axios from "axios";

export default {
  components: {
    ImgDisplay: ImgDisplay,
    FilmForm: FilmForm
  },
  methods: {
    postCreate: function(payload) {
      var that = this;
      var createUrl = "http://localhost:3000/api/v1/films/";

      console.log(payload);

      var params = new FormData();
      params.append("title", payload.title);
      params.append("year", payload.year);
      params.append("intro", payload.intro);
      console.log(params);
      // get data from api
      axios
        .post(createUrl, params, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        })
        .then(function(res) {
          console.log("Create film success!!");
          that.$router.push("/films/" + res.data.result.id);
        })
        .catch(function(err) {
          console.error(err.response.data);
        });
    }
  }
};
</script>