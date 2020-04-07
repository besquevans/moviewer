<template>
  <v-app>
    <v-app-bar app>
      <Header />
    </v-app-bar>

    <v-content>
      <v-container>
        <router-view />
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
import Header from "./src/components/Header";
import AuthPanel from "./src/components/shared/AuthPanel";

export default {
  name: "App",
  components: {
    Header: Header
  }
};
</script>


