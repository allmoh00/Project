import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', name: 'home', component: () => import('@/views/HomeView.vue') },
    { path: '/arts-culture', name: 'artsCulture', component: () => import('@/views/ArtsCultureView.vue') },
    { path: '/tourist-places', name: 'touristPlaces', component: () => import('@/views/TouristPlacesView.vue') },
    { path: '/experience', name: 'experience', component: () => import('@/views/ExperienceView.vue') },
    { path: '/contact', name: 'contact', component: () => import('@/views/ContactView.vue') },
    { path: '/about', name: 'about', component: () => import('@/views/AboutView.vue') },
    { path: '/team', name: 'team', component: () => import('@/views/TeamView.vue') },
    {
      path: '/team/:id',
      name: 'teamMember',
      component: () => import('@/views/TeamMemberView.vue'),
      props: true,
    },
    {
      path: '/places/:slug',
      name: 'placeDetail',
      component: () => import('@/views/PlaceDetailView.vue'),
      props: true,
    },
    { path: '/:pathMatch(.*)*', name: 'notFound', component: () => import('@/views/NotFoundView.vue') },
  ],
  scrollBehavior() {
    return { top: 0 }
  },
})

export default router

