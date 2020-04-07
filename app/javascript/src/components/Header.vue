<template>
  <v-toolbar flat color="white">
    <v-toolbar-title>
      <router-link to="/">{{ title }}</router-link>
    </v-toolbar-title>
    <v-spacer></v-spacer>

    <router-link to="omdb">
      <v-btn>{{ search }}</v-btn>
    </router-link>

    <div class="user-unlogin-container" v-if="!isLogin">
      <v-btn @click="handleSignUp">Sign up</v-btn>
      <v-btn @click="handleLogin">Login</v-btn>
    </div>

    <div class="user-login-container" v-else>
      <p class="user-email">{{ userEmail }}</p>
      <v-btn @click="handleLogout">Log out</v-btn>
    </div>
  </v-toolbar>
</template>

<script>
export default {
  data() {
    return {
      title: "Moviewer",
      search: "Search",
      isLogin: false,
      userEmail: "test@mail.com"
    };
  },
  methods: {
    handleSignUp: function() {
      this.$router.push("/signup");
    },
    handleLogin: function() {
      this.$router.push("/login");
    },
    handleLogout: function() {
      console.log("logout");
    }
  }
};
</script>
