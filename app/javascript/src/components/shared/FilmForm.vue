<template>
  <div class="film-form">
    <input type="text" id="title" placeholder="Title" v-model="newTitle" />
    <input type="value" id="year" placeholder="Year" v-model="newYear" />
    <textarea name="intro" id="intro" placeholder="intro" rows="7" v-model="newIntro" />

    <button class="submit-btn" @click="handleSubmit">Submit</button>
  </div>
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      default: ""
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
      const payload = {
        title: this.newTitle,
        year: this.newYear,
        intro: this.newIntro
        //file_location: this.file
      };
      console.log("submit film from");
      console.dir(payload);
    }
  }
};
</script>