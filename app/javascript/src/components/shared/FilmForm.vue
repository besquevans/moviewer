<template>
  <v-form>
    <v-text-field label="Title" v-model="newTitle"></v-text-field>
    <v-text-field label="Year" v-model="newYear"></v-text-field>
    <v-textarea label="Intro" v-model="newIntro"></v-textarea>
    <v-btn class="mr-4" @click="handleSubmit">Submit</v-btn>
  </v-form>
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      default: ""
    },
    year: {
      type: Number,
      default: 2020
    },
    intro: {
      type: String,
      default: ""
    }
  },
  data: function() {
    return {
      newYear: this.year,
      newTitle: this.title,
      newIntro: this.intro
      //file: ""
    };
  },
  methods: {
    handleSubmit: function() {
      var payload = {
        title: this.newTitle,
        year: this.newYear,
        intro: this.newIntro
        //file_location: this.file
      };
      // form submit
      this.$emit("film-form-submit", payload);
      console.log("submit film from");
    }
  }
};
</script>