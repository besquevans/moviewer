<template>
  <v-container>
    <v-row>
      <v-col cols="12" md="4">
        <ImgDisplay />
      </v-col>
      <v-col cols="12" md="8">
        <FilmForm
          :title="film.title"
          :year="film.year"
          :intro="film.intro"
          v-if="film.title"
          @film-form-submit="patchUpdate"
        />
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
  },
  methods: {
    patchUpdate: function(payload) {
      var that = this;
      var id = this.$route.params.id;
      var updateUrl = "http://localhost:3000/api/v1/films/" + id;
      // pack params using FormData
      console.log(payload);

      var params = new FormData();
      params.append("title", payload.title);
      params.append("year", payload.year);
      params.append("intro", payload.intro);
      console.log(params);
      // get data from api
      axios
        .patch(updateUrl, params, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        })
        .then(function(res) {
          console.log("Edit film success!!");
          that.$router.push("/films/" + res.data.result.id);
        })
        .catch(function(err) {
          console.error(err.response);
        });
    }
  }
};
</script>
