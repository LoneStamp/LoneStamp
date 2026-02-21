import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import App from './App.vue'
import './styles/global.css'

import HomeView from './views/HomeView.vue'
import ShowcaseView from './views/ShowcaseView.vue'
import LifeView from './views/LifeView.vue'
import GalleryView from './views/GalleryView.vue'
import ProjectsView from './views/ProjectsView.vue'
import EventsView from './views/EventsView.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: HomeView },
    { path: '/showcase', component: ShowcaseView },
    { path: '/life', component: LifeView },
    { path: '/gallery', component: GalleryView },
    { path: '/projects', component: ProjectsView },
    { path: '/events', component: EventsView },
  ],
  scrollBehavior() {
    return { top: 0 }
  }
})

const app = createApp(App)
app.use(router)
app.mount('#app')
