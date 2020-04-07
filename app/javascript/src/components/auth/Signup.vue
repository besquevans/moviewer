<template>
  <AuthPanel type="signup" @auth-panel-submit="handleSignUp" />
</template>

<script>
import AuthPanel from "../shared/AuthPanel.vue";
import axios from "axios";

export default {
  components: {
    AuthPanel: AuthPanel
  },
  methods: {
    handleSignUp: function(payload) {
      var that = this;
      var signupUrl = "http://localhost:3000/api/v1/signup/";
      axios
        .post(signupUrl, payload)
        .then(function(res) {
          console.log("Sign Up success!!");
          console.log(res.data);
          that.$router.puth("/login");
        })
        .catch(function(err) {
          console.error(err.response.data.errors);
        });
    }
  }
};
</script>