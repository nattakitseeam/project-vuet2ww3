<template>
  <!-- heroes -->
  <div class="px-4 py-5 my-5 text-center"> <img class="d-block mx-auto mb-4" src="../assets/image/monkey.jpg" alt=""
      width="150" height="150">
    <h1 class="display-5 fw-bold text-body-emphasis">Centered hero</h1>
    <div class="col-lg-6 mx-auto">
      <p class="lead mb-4">Quickly design and customize responsive mobile-first sites with Bootstrap, the world’s most
        popular front-end open source toolkit, featuring Sass variables and mixins, responsive grid system, extensive
        prebuilt components, and powerful JavaScript plugins.</p>
      <div class="d-grid gap-2 d-sm-flex justify-content-sm-center"> <button type="button"
          class="btn btn-primary btn-lg px-4 gap-3">Primary button</button> <button type="button"
          class="btn btn-outline-secondary btn-lg px-4">Secondary</button> </div>
    </div>
  </div>




  <!---3 คอลัมน์--->
  <div class="container px-4 py-5" id="featured-3">
    <h2 class="pb-2 border-bottom">Columns with icons</h2>
    <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
      <div class="feature col">
        <div
          class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3">
          <svg class="bi" width="1em" height="1em" aria-hidden="true">
            <use xlink:href="#collection"></use>
          </svg>
        </div>
        <h3 class="fs-2 text-body-emphasis">Featured title</h3>
        <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and
          probably just keep going until we run out of words.</p> <a href="#" class="icon-link">
          Call to action
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#chevron-right"></use>
          </svg> </a>
      </div>
      <div class="feature col">
        <div
          class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3">
          <svg class="bi" width="1em" height="1em" aria-hidden="true">
            <use xlink:href="#people-circle"></use>
          </svg>
        </div>
        <h3 class="fs-2 text-body-emphasis">Featured title</h3>
        <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and
          probably just keep going until we run out of words.</p> <a href="#" class="icon-link">
          Call to action
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#chevron-right"></use>
          </svg> </a>
      </div>
      <div class="feature col">
        <div
          class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3">
          <svg class="bi" width="1em" height="1em" aria-hidden="true">
            <use xlink:href="#toggles2"></use>
          </svg>
        </div>
        <h3 class="fs-2 text-body-emphasis">Featured title</h3>
        <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and
          probably just keep going until we run out of words.</p> <a href="#" class="icon-link">
          Call to action
          <svg class="bi" aria-hidden="true">
            <use xlink:href="#chevron-right"></use>
          </svg> </a>
      </div>
    </div>
  </div>

<!--2 คอลัมน์-->
  <div class="container col-xl-10 col-xxl-8 px-4 py-5">
    <div class="row align-items-center g-lg-5 py-5">
      <div class="col-lg-7 text-center text-lg-start">
        <h1 class="display-4 fw-bold lh-1 text-body-emphasis mb-3">Vertically centered hero sign-up form</h1>
        <p class="col-lg-10 fs-4">Below is an example form built entirely with Bootstrap’s form controls. Each required
          form group has a validation state that can be triggered by attempting to submit the form without completing
          it.</p>
      </div>
      <div class="col-md-10 mx-auto col-lg-5">
        <form class="p-4 p-md-5 border rounded-3 bg-body-tertiary">
          <div class="form-floating mb-3"> <input type="email" class="form-control" id="floatingInput"
              placeholder="name@example.com"> <label for="floatingInput">Email address</label> </div>
          <div class="form-floating mb-3"> <input type="password" class="form-control" id="floatingPassword"
              placeholder="Password"> <label for="floatingPassword">Password</label> </div>
          <div class="checkbox mb-3"> <label> <input type="checkbox" value="remember-me"> Remember me
            </label> </div> <button class="w-100 btn btn-lg btn-primary" type="submit">Sign up</button>
          <hr class="my-4"> <small class="text-body-secondary">By clicking Sign up, you agree to the terms of
            use.</small>
        </form>
      </div>
    </div>
  </div>












</template>
