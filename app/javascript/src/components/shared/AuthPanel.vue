<template>
  <v-card class="d-flex pa-102" color="indigo darken-2">
    <v-card elevation="12" width="256">
      <v-card-title>Please {{ content }}</v-card-title>

      <v-form>
        <v-text-field label="Email" v-model="email"></v-text-field>
        <v-text-field label="Password" v-model="password"></v-text-field>
      </v-form>
      <v-card-actions>
        <v-btn @click="handleSubmit">{{ content }}</v-btn>
        <v-btn @click="cancelSubmit">{{ cancel }}</v-btn>
      </v-card-actions>
    </v-card>
  </v-card>
</template>

<script>
export default {
  props: ["type"],
  data: function() {
    return {
      email: "",
      password: "",
      cancel: "Cancel"
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
      console.log("submit auth");
      console.log("payload");
    },
    cancelSubmit: function() {
      this.$emit("auth-submit", false);
      console.log("cancelSubmit");
    }
  }
};
</script>