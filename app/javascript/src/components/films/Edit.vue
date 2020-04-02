<template>
  <div class="edit">
    <div class="photo-container">
      <ImgDisplay />
    </div>
    <div class="main-container">
      <FilmForm />
    </div>
  </div>
</template>

<script>
import ImgDisplayVue from "../shared/ImgDisplay.vue";
import FilmFormVue from "../shared/FilmForm.vue";

export default {
  components: {
    ImgDisplay: ImgDisplayVue,
    FilmForm: FilmFormVue
  },
  data: function() {
    return {
      film: {}
    };
  }
};
</script>
