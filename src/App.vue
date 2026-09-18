<template>
  <div>

<!--แสดงเมนู-->
   <navbar />
   
<!--แสดงหน้าจอ-->
   <router-view />

<!--แสดงหน้าจอ Footer -->
   <Footer />
   
  </div>
</template>

<script>
import Navbar from './components/Navbar.vue';
import Footer from './components/footer.vue';



export default {
  name: "App",
  components : {Navbar,Footer}
};
</script>
