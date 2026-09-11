<template>
  <div class="container mt-4 col-md-4 bg-body-secondary ">
    <h2 class="text-center mb-3">เพิ่มข้อมูลพนักงาน</h2>
    <form @submit.prevent="addData">
      <div class="mb-2">
        <input v-model="employee.firstName" class="form-control" placeholder="ชื่อ" required />
      </div>
      <div class="mb-2">
        <input v-model="employee.lastName" class="form-control" placeholder="นามสกุล" required />
      </div>
      <div class="mb-2">
        <input  v-model="employee.phone" class="form-control" placeholder="เบอร์โทร" required />
      </div>
      <div class="mb-2">
        <input v-model="employee.username" class="form-control" placeholder="ชื่อผู้ใช้" required />
      </div>
      <div class="mb-2">
        <input type="password" v-model="employee.password" class="form-control" placeholder="รหัสผ่าน" required />
      </div>
      <div class="text-center mt-4 ">
      <button type="submit" class="btn btn-primary mb-4">บันทึก</button> &nbsp;
      <button type="reset" class="btn btn-secondary mb-4">ยกเลิก</button>
      </div>
    </form>

    <div v-if="message" class="alert alert-info mt-3">
      {{ message }}
    </div>
  </div>
</template>


<script>
export default {
  data() {
    return {
      employee: {
        firstName: "",
        lastName: "",
        phone: "",
        username: "",
        password: ""
      },
      message: ""
    };
  },
  methods: {
    async addData() {
      try {
        const res = await fetch("http://localhost/project-vuet2ww3/php_api/add_employee.php", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(this.employee)
        });
        const data = await res.json();
        this.message = data.message;

        if (data.success) {
          // ✅ เคลียร์ข้อมูลใน textbox หลังบันทึกสำเร็จ
          this.employee = { firstName: "", lastName: "", phone: "", username: "", password: "" };
        }

      } catch (err) {
        this.message = "เกิดข้อผิดพลาด: " + err.message;
      }
    }
  }
}
</script>
