<template>
  <v-app>
    <v-app-bar app>
      <Header @auth-submit="authUser" />
    </v-app-bar>

    <v-content>
      <v-container>
        <template v-if="auth === true">
          <AuthPanel @auth-submit="authUser" />
        </template>
        <template v-else>
          <router-view />
        </template>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
import Header from "./src/components/Header";
import AuthPanel from "./src/components/shared/AuthPanel";

export default {
  name: "App",
  data() {
    return {
      auth: false
    };
  },
  components: {
    Header: Header,
    AuthPanel: AuthPanel
  },
  methods: {
    authUser: function(authPanel) {
      this.auth = authPanel;
    }
  }
};
</script>


