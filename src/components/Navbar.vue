<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
      <router-link class="navbar-brand fw-bold" to="/">Shabu House</router-link>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <router-link class="nav-link" to="/">Home</router-link>
          </li>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Product
          </a>
          <ul class="dropdown-menu">
            <li v-if="isLoggedIn"><a class="dropdown-item" href="/product">product</a></li>
            <li><a class="dropdown-item" href="/show_product">show product</a></li>
            <li v-if="isLoggedIn"><a class="dropdown-item" href="/asset">asset</a></li>
          </ul>
        </li>
   
  
          <li class="nav-item">
            <router-link class="nav-link" to="/customer_crud">Customer_crud</router-link>
          </li>
           <li class="nav-item">
            <router-link class="nav-link" to="/menu">Menu</router-link>
          </li>
           <li class="nav-item">
            <router-link class="nav-link" to="/customer">Customer</router-link>
          </li>
         
          <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Contact 
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/contact">contact</a></li>
            <li><a class="dropdown-item" href="/contact_crud">contact_crud</a></li>
            <li><a class="dropdown-item" href="#">Logout</a></li>
          </ul>
        </li>
          

          <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Emloyee
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/employee">Employee</a></li>
            <li v-if="isLoggedIn"><a class="dropdown-item" href="/employee_crud">Employee_crud</a></li>
            <li><a class="dropdown-item" href="#">Logout</a></li>
          </ul>
        </li>
                    <!-- ================= Register ================= -->
                    <!-- แสดงเฉพาะเมื่อยังไม่ Login -->
                    <li class="nav-item dropdown" v-if="!isLoggedIn">
                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            role="button"
                            data-bs-toggle="dropdown"
                        >
                            Register
                        </a>

                        <ul class="dropdown-menu">
                            <li>
                                <a class="dropdown-item" href="/add_customer">
                                    Register
                                </a>
                            </li>

                            <li>
                                <a class="dropdown-item" href="/login">
                                    Login
                                </a>
                            </li>
                        </ul>
                    </li>

                </ul>

                <!-- ================= User Information ================= -->
                <!-- แสดงเฉพาะเมื่อ Login แล้ว -->
                <div
                    class="d-flex align-items-center ms-lg-3 mt-2 mt-lg-0"
                    v-if="isLoggedIn"
                >
                    <span class="text-white me-3">
                        <i class="bi bi-person-circle"></i>
                        {{ userName }}
                    </span>

                    <button
                        @click="logout"
                        class="btn btn-danger btn-sm"
                    >
                        <i class="bi bi-box-arrow-right"></i>
                        Logout
                    </button>
                </div>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
    name: "Navbar",

    data() {
        return {
            // สถานะ Login
            isLoggedIn: false,

            // ชื่อผู้ใช้งาน
            userName: ""
        };
    },

    // ทำงานเมื่อ Component ถูกสร้าง
    mounted() {
        this.checkLogin();
    },

    methods: {

        // ตรวจสอบสถานะ Login
        checkLogin() {

            this.isLoggedIn =
                localStorage.getItem("adminLogin") === "true";

            if (this.isLoggedIn) {

                try {
                    // อ่านข้อมูลผู้ใช้
                    const userData = localStorage.getItem("user");

                    const user = userData
                        ? JSON.parse(userData)
                        : null;

                    // กำหนดชื่อผู้ใช้
                    this.userName =
                        user?.name || user?.username || "Admin";

                } catch (error) {
                    this.userName = "Admin";
                }

            } else {
                this.userName = "";
            }
        },

        // ออกจากระบบ
        logout() {

            // ลบข้อมูล Login
            localStorage.removeItem("adminLogin");
            localStorage.removeItem("user");

            // รีเซ็ตสถานะ
            this.isLoggedIn = false;
            this.userName = "";

            // กลับหน้า Login
            this.$router.push("/login");
        }
    },

    // ตรวจสอบสถานะใหม่เมื่อเปลี่ยนหน้า
    watch: {
        '$route'() {
            this.checkLogin();
        }
    }
};
</script>

