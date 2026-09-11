<template>
  <div>

<!--แสดงเมนู-->
   <navbar />
   
<!--แสดงหน้าจอ-->
   <router-view/>
  </div>
</template>

<script>
import Navbar from './components/Navbar.vue';



export default {
  name: "App",
  components : {Navbar}
};
</script>
