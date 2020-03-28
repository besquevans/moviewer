<template>
  <div id="app">
    <Header />
    <router-view />
  </div>
</template>

<script>
import Header from "./src/components/Header";

export default {
  name: "App",
  components: {
    Header: Header
  }
};
</script>


