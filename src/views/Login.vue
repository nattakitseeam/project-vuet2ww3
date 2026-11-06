
<template>
    <div class="container">
        <div class="row justify-content-center align-items-center vh-100">
            <div class="col-md-5 col-lg-4">

                <div class="card shadow-lg border-0">
                    <div class="card-body p-4">

                        <h4 class="text-center mb-4">
                            🔐 เข้าสู่ระบบผู้ดูแล
                        </h4>

                        <!-- Username -->
                        <div class="mb-3">
                            <label class="form-label">ชื่อผู้ใช้</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-person"></i>
                                </span>

                                <input
                                    v-model="username"
                                    type="text"
                                    class="form-control"
                                    placeholder="กรอกชื่อผู้ใช้"
                                    @keyup.enter="login"
                                />
                            </div>
                        </div>

                        <!-- Password -->
                        <div class="mb-3">
                            <label class="form-label">รหัสผ่าน</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-lock"></i>
                                </span>

                                <input
                                    v-model="password"
                                    type="password"
                                    class="form-control"
                                    placeholder="กรอกรหัสผ่าน"
                                    @keyup.enter="login"
                                />
                            </div>
                        </div>

                        <!-- Button -->
                        <button
                            @click="login"
                            class="btn btn-primary w-100"
                            :disabled="loading"
                        >
                            <span
                                v-if="loading"
                                class="spinner-border spinner-border-sm me-2"
                            ></span>

                            {{ loading ? 'กำลังเข้าสู่ระบบ...' : 'เข้าสู่ระบบ' }}
                        </button>

                        <!-- Error -->
                        <div
                            v-if="error"
                            class="alert alert-danger mt-3 mb-0 text-center"
                        >
                            {{ error }}
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
export default {

    data() {
        return {
            username: "",
            password: "",
            error: "",
            loading: false,
        };
    },

    methods: {

        async login() {

            this.error = "";

            // ตรวจสอบข้อมูล
            if (!this.username || !this.password) {
                this.error = "กรุณากรอกข้อมูลให้ครบ";
                return;
            }

            try {

                this.loading = true;

                // เรียก PHP API ด้วย Fetch API
                const response = await fetch(
                    "http://localhost/project-vuet2ww3/php_api/login.php",
                    {
                        method: "POST",

                        headers: {
                            "Content-Type": "application/json"
                        },

                        body: JSON.stringify({
                            username: this.username,
                            password: this.password
                        })
                    }
                );

                // แปลง Response เป็น JSON
                const data = await response.json();

                console.log(data);

                // ตรวจสอบ HTTP Status
                if (!response.ok) {
                    throw new Error(
                        data.message || "เกิดข้อผิดพลาดจาก Server"
                    );
                }

                // ตรวจสอบผลการ Login
                if (data.success) {

                    localStorage.setItem(
                        "adminLogin",
                        "true"
                    );

                    localStorage.setItem(
                        "user",
                        JSON.stringify(data.user)
                    );

                    // ไปหน้าแรก  ถ้า Login สำเร็จจะให้ไปแสดงหน้าไหนให้กำหนดตรงนี้
                    this.$router.push("/product");

                } else {

                    this.error = data.message || "ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง";

                }

            } catch (err) {

                console.error(err);

                this.error =
                    err.message === "Failed to fetch"
                    ? "ไม่สามารถเชื่อมต่อ Server ได้"
                    : err.message || "เกิดข้อผิดพลาดในการเชื่อมต่อ Server";

            } finally {

                this.loading = false;

            }

        }

    }

};
</script>
