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
    
    component: () => import('../views/Customer_crud.vue'),
    meta: { requiresAuth: true }     // ✅ บังคับ login
  },
  {
    path: '/employee_crud',
    name: '/employee_crud',
    
    component: () => import('..//views//Employee_crud.vue'),
    meta: { requiresAuth: true } 
  },
  {
    path: '/contact_crud',
    name: '/contact_crud',
    
    component: () => import('..//views//Contact_crud.vue')
  },
   {
    path: '/product',
    name: '/product',
    
    component: () => import('..//views//Product.vue'),
    meta: { requiresAuth: true } 
  },
   {
    path: '/show_product',
    name: '/show_product',
    
    component: () => import('..//views//Show_product.vue')
  },
  {
    path: '/asset',
    name: '/asset',
    
    component: () => import('..//views//Asset.vue'),
    meta: { requiresAuth: true } 
  },
    {
    path: '/login',
    name: '/login',
    
    component: () => import('..//views/Login.vue')
  }
  
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})





// ตรวจสอบสิทธิ์ก่อนเปลี่ยนหน้า
router.beforeEach((to, from, next) => {

  // ตรวจสอบสถานะ Login จาก localStorage
  const isLoggedIn = localStorage.getItem('adminLogin') === 'true'

  // ถ้าหน้านั้นต้อง Login แต่ยังไม่ได้ Login
  if (to.meta.requiresAuth && !isLoggedIn) {
    next('/login')
  }

  // ถ้า Login แล้ว ไม่ต้องกลับไปหน้า Login
  else if (to.path === '/login' && isLoggedIn) {
    next('/')
  }

  // กรณีอื่น ๆ อนุญาตให้เข้าหน้าได้
  else {
    next()
  }
})



export default router
