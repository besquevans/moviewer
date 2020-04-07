<template>
  <AuthPanel type="login" @auth-panel-submit="handleLogin" />
</template>

<script>
import AuthPanel from "../shared/AuthPanel.vue";

export default {
  components: {
    AuthPanel: AuthPanel
  },
  methods: {
    handleLogin: function(payload) {
      var that = this;
      var loginUrl = "http://localhost:3000/api/v1/login/";
      axios
        .post(loginUrl, payload)
        .then(function(res) {
          console.log("Login success!!");
          console.log(res.data);
          that.$router.puth("/");
        })
        .catch(function(err) {
          console.error(err.response.data.errors);
        });
    }
  }
};
</script>