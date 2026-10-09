import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'



// ✅ Import Bootstrap
import "bootstrap/dist/css/bootstrap.min.css";
import * as bootstrap from "bootstrap"; // ⭐ import ทั้งโมดูล
window.bootstrap = bootstrap; // ✅ ผูกเข้ากับ global window object




createApp(App).use(store).use(router).mount('#app')
