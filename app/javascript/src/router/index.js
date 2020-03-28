import Vue from 'vue'
import Router from 'vue-router'
import Film from "../components/Film.vue";
import Omdb from "../components/Omdb.vue";

Vue.use(Router)
export default new Router({
	routes: [
		{
			path: '/',
			name: 'root_path',
			component: Film
		},
		{
			path: '/omdb',
			name: 'omdb_path',
			component: Omdb
		}
	]
})