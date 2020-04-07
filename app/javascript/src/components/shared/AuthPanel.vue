<template>
  <v-form>
    <h1>Please {{ content }}</h1>
    <v-text-field label="Email" v-model="email"></v-text-field>
    <v-text-field label="Password" v-model="password"></v-text-field>
    <v-btn class="mr-4" @click="handleSubmit">{{ content }}</v-btn>
  </v-form>
</template>

<script>
export default {
  props: ["type"],
  data: function() {
    return {
      email: "",
      password: ""
    };
  },
  computed: {
    content: function() {
      if (this.type === "login") {
        return "Login";
      } else {
        return "Sign up";
      }
    }
  },
  methods: {
    handleSubmit: function() {
      const payload = {
        email: this.email,
        password: this.password
      };
      this.$emit("auth-panel-submit", payload);
      console.log("submit auth");
      console.dir(payload);
    }
  }
};
</script>