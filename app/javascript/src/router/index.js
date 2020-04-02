import Vue from 'vue'
import Router from 'vue-router'
import Films from "../components/films/Index.vue";
import Show from "../components/films/Show.vue";
import New from "../components/films/New.vue";
import Edit from "../components/films/Edit.vue";
import Film from "../components/Film.vue";
import Omdb from "../components/Omdb.vue";

Vue.use(Router)
export default new Router({
	routes: [
		{
			path: '/',
			name: 'root_path',
			component: Films
		},
		{
			path: '/films/:id',
			name: 'Show',
			component: Show
		},
		{
			path: 'films/new',
			name: 'New',
			component: New
		},
		{
			path: 'films/edit/:id',
			name: 'Edit',
			component: Edit
		},
		{
			path: '/omdb',
			name: 'omdb_path',
			component: Omdb
		},
		{
			path: '/film',
			name: 'film_path',
			component: Film
		},
	]
})