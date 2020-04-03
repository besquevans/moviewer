<template>
  <div class="show">
    <div class="film-container">
      <ImgDisplay />
    </div>
    <div class="main-container">
      <h3 class="main-title">{{title}}</h3>
      <p class="main-year">{{year}}</p>
      <p class="main-intro">{{intro}}</p>
    </div>
  </div>
</template>

<script>
import ImgDisplay from "../shared/ImgDisplay";
import axios from "axios";

export default {
  data: function() {
    return {
      title: "",
      intro: "",
      //url: "",
      year: null
    };
  },
  components: {
    ImgDisplay: ImgDisplay
  },
  created: function() {
    var that = this;
    var id = this.$route.params.id;
    var showUrl = "http://localhost:3000/api/v1/films/" + id;

    axios
      .get(showUrl)
      .then(function(res) {
        console.log(res);
        that.title = res.data.title;
        that.year = res.data.year;
        that.intro = res.data.intro;
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