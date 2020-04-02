require('./bootstrap');

window.Vue = require('vue');

import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import App from './components/App'
import Hello from './components/Hello'
import Home from './components/Home'
import Login from './user_components/Login.vue'
import Register from './user_components/Register.vue'
import Content from './components/Content.vue'
import History from './components/History.vue'
import Favorite from './components/Favorite.vue'

Vue.component('viewer', require('./components/Viewer.vue').default);
Vue.component('recaptcha', require('./user_components/Recaptcha.vue').default);
Vue.component('modal', require('./components/Modal.vue').default);

const router = new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home,
        },
        {
            path: '/hello',
            name: 'hello',
            component: Hello,
        },
        {
            path: '/login',
            name: 'login',
            component: Login,
        },
        {
            path: '/register',
            name: 'register',
            component: Register,
        },
        {
            path: '/content',
            name: 'content',
            component: Content,
        },
        {
            path: '/history',
            name: 'history',
            component: History,
        },
        {
            path: '/favorite',
            name: 'favorite',
            component: Favorite,
        },

    ],
});

const app = new Vue({
    el: '#app',
    components: { App },
    router,
});