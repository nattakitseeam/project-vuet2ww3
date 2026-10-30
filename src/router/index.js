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
  },
   {
    path: '/contact',
    name: 'contact',
    
    component: () => import('../views/Contact.vue')
  },
    {
    path: '/add_contact',
    name: 'add_contact',
    
    component: () => import('../views/Add_contact.vue')
  },
    {
    path: '/customer_crud',
    name: 'customer_crud',
    
    component: () => import('../views/Customer_crud.vue')
  },
  {
    path: '/employee_crud',
    name: '/employee_crud',
    
    component: () => import('..//views//Employee_crud.vue')
  },
  {
    path: '/contact_crud',
    name: '/contact_crud',
    
    component: () => import('..//views//Contact_crud.vue')
  },
   {
    path: '/product',
    name: '/product',
    
    component: () => import('..//views//Product.vue')
  },
   {
    path: '/show_product',
    name: '/show_product',
    
    component: () => import('..//views//Show_product.vue')
  },
  {
    path: '/asset',
    name: '/asset',
    
    component: () => import('..//views//Asset.vue')
  }
  
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
