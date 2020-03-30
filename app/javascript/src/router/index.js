import Vue from 'vue'
import Router from 'vue-router'
import Films from "../components/films/Index.vue";
import Show from "../components/films/Show.vue";
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
			path: '/Show',
			name: 'Show',
			component: Show
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