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
          <li class="nav-item">
            <router-link class="nav-link" to="/showproduct">Show Product</router-link>
          </li>
           <li class="nav-item">
            <router-link class="nav-link" to="/menu">Menu</router-link>
          </li>
           <li class="nav-item">
            <router-link class="nav-link" to="/customer">Customer</router-link>
          </li>
           <li class="nav-item">
            <router-link class="nav-link" to="/employee">Employee</router-link>
          </li>
           <li class="nav-item">
            <router-link class="nav-link" to="/contact">Contact</router-link>
          </li>
           
          <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Register
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Register</a></li>
            <li><a class="dropdown-item" href="#">Login</a></li>
            <li><a class="dropdown-item" href="#">Logout</a></li>
          </ul>
        </li>







           <li class="nav-item">
            <router-link class="nav-link" to="/about">About</router-link>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: "Navbar"
}
</script>


