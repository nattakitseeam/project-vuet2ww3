import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    
    component: () => import('../views/AboutView.vue')
  },
  {
    path: '/customer',
    name: 'customer',
    
    component: () => import('../views/Customer.vue')
  },
  {
    path: '/employee',
    name: 'employee',
    
    component: () => import('../views/Employee.vue')
  },
  {
    path: '/add_Customer',
    name: 'add_Customer',
    
    component: () => import('../views/Add_Customer.vue')
  },
    {
    path: '/add_employee',
    name: 'add_employee',
    
    component: () => import('../views/Add_employee.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
