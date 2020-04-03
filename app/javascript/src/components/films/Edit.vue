<template>
  <v-container>
    <v-row>
      <v-col cols="12" md="4">
        <ImgDisplay />
      </v-col>
      <v-col cols="12" md="8">
        <FilmForm :title="film.title" :year="film.year" :intro="film.intro" v-if="film.title" />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import ImgDisplayVue from "../shared/ImgDisplay.vue";
import FilmFormVue from "../shared/FilmForm.vue";
import axios from "axios";

export default {
  components: {
    ImgDisplay: ImgDisplayVue,
    FilmForm: FilmFormVue
  },
  data: function() {
    return {
      film: {}
    };
  },
  created: function() {
    var that = this;
    var id = this.$route.params.id;
    var url = "http://localhost:3000/api/v1/films/" + id;

    axios
      .get(url)
      .then(function(res) {
        console.log(res);
        that.film = res.data;
      })
      .catch(function(error) {
        if (!error.response) {
          console.log("Error: Network Error");
        } else {
          console.log(error.response.data.message);
        }
      });
  }
};
</script>
