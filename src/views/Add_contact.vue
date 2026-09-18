<template>
  <div class="container mt-4 col-md-4 bg-body-secondary ">
    <h2 class="text-center mb-3">ลงทะเบียน</h2>
    <form @submit.prevent="addData">
      <div class="mb-2">
        <input v-model="contact.subject" class="form-control" placeholder="เรื่อง" required />
      </div>
      <div class="mb-2">
        <input v-model="contact.detail" class="form-control" placeholder="รายละเอียด" required />
      </div>
      <div class="mb-2">
        <input  v-model="contact.fullname" class="form-control" placeholder="ชื่อจริง" required />
      </div>
      <div class="mb-2">
        <input v-model="contact.email" class="form-control" placeholder="อีเมล" required />
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
      contact: {
        contact_id:"",
        subject: "",
        detail: "",
        fullname: "",
        email: "",
      },
      message: ""
    };
  },
  methods: {
    async addData() {
      try {
        const res = await fetch("http://localhost/project-vuet2ww3/php_api/add_contacts.php", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(this.contact)
        });
        const data = await res.json();
        this.message = data.message;

        if (data.success) {
          // ✅ เคลียร์ข้อมูลใน textbox หลังบันทึกสำเร็จ
          this.contact = { subject: "", detail: "", fullname: "", email: "" };
        }

      } catch (err) {
        this.message = "เกิดข้อผิดพลาด: " + err.message;
      }
    }
  }
}
</script>
