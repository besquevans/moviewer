<template>
  <div class="create">
    <div class="photo-container">
      <ImgDisplay />
    </div>
    <div class="main-container">
      <FilmForm />
    </div>
  </div>
</template>

<script>
import ImgDisplay from "../shared/ImgDisplay.vue";
import FilmFormVue from "../shared/FilmForm.vue";

export default {
  components: {
    ImgDisplay: ImgDisplay,
    FilmForm: FilmFormVue
  }
};
</script>