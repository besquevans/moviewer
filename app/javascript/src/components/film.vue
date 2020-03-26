<template>
  <v-data-table :headers="headers" :items="films" sort-by="id" class="elevation-1">
    <template v-slot:top>
      <v-toolbar flat color="white">
        <v-toolbar-title>Films</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>

        <v-dialog v-model="dialog" max-width="800px">
          <template v-slot:activator="{ on }">
            <v-btn color="primary" dark class="mb-2" v-on="on">New Film</v-btn>
          </template>

          <!--------edit or update film------------->
          <v-card>
            <v-card-title>
              <span class="headline">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="editedItem.title" label="Title"></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="editedItem.year" label="Year"></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="editedItem.intro" label="Intro"></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="close">Cancel</v-btn>
              <v-btn color="blue darken-1" text @click="save(editedItem)">Save</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>

    <template v-slot:item.action="{ item }">
      <v-icon small class="mr-2" @click="editItem(item)">edit</v-icon>
      <v-icon small @click="deleteItem(item)">delete</v-icon>
    </template>

    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize">Reset</v-btn>
    </template>
  </v-data-table>
</template>

<script>
import axios from "axios";
export default {
  data: () => ({
    dialog: false,
    headers: [
      {
        text: "ID",
        align: "left",
        sortable: false,
        value: "id"
      },
      { text: "Title", value: "title" },
      { text: "Year", value: "year" },
      { text: "Intro", value: "intro" },
      { text: "Actions", value: "action", sortable: false }
    ],
    films: [],
    editedIndex: -1,
    editedItem: {
      title: "",
      year: "",
      intro: ""
    },
    defaultItem: {
      title: "",
      year: "",
      intro: ""
    }
  }),
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "New Film" : "Edit Film";
    }
  },
  watch: {
    dialog(val) {
      val || this.close();
    }
  },
  created() {
    this.initialize();
  },
  methods: {
    //cancel editing film
    close() {
      this.dialog = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
    },
    //use axios get backend films index
    initialize() {
      //films index
      return axios
        .get("http://localhost:3000/films")
        .then(response => {
          console.log(response.data);
          this.films = response.data;
        })
        .catch(e => {
          console.log(e);
        });
    },
    //use axios get backend films show
    getFilm(item) {
      //show the film
      axios
        .get(`https://localhost:3000/${item.id}`)
        .then(response => {
          this.dessert = response.data;
        })
        .catch(error => {
          console.log(error);
        });
    },
    editItem(item) {
      //edit the film
      this.editedIndex = item.id;
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },
    save(item) {
      if (this.editedIndex > -1) {
        //update the film
        axios
          .put(`http://localhost:3000/films/${item.id}`, {
            title: this.editedItem.title,
            year: this.editedItem.year,
            intro: this.editedItem.intro
          })
          .then(response => {
            console.log(response);
            this.initialize();
          })
          .catch(error => {
            console.log(error);
          });
      } else {
        //create new film
        axios
          .post(`http://localhost:3000/films/`, {
            film: this.editedItem
          })
          .then(response => {
            console.log(response);
            console.log("Success!");
            this.initialize();
          })
          .catch(error => {
            console.log(error);
          });
      }
      this.close();
    },
    deleteItem(item) {
      const index = this.films.indexOf(item);
      confirm("Are you sure you want to delete this film?");
      axios
        .delete(`http://localhost:3000/films/${item.id}`)
        .then(response => {
          console.log(response);
          console.log(response.data.json);
          alert(response.data.json);
          this.initialize();
        })
        .catch(error => {
          console.log(error);
        });
      //remove 1 object from array
      this.films.splice(index, 1);
    }
  }
};
</script>