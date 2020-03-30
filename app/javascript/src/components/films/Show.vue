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
export default {
  data: function() {
    return {
      title: "Title",
      intro:
        "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dignissimos, cupiditate.",
      url: "",
      year: 2018
    };
  },
  components: {
    ImgDisplay: ImgDisplay
  }
};
</script>