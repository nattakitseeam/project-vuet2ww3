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


