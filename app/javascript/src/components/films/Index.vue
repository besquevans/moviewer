<template>
  <div class="container">
    <itemElement />
  </div>
</template>

<script>
import ItemElement from "../shared/ItemElement.vue";

export default {
  data: function() {
    return {
      isLogin: true,
      films: [1, 2, 3, 4, 5]
    };
  },
  components: {
    ItemElement: ItemElement
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