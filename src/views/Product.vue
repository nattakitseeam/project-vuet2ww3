<template>
  <div class="container mt-4">
    <h2 class="mb-3">รายการสินค้า</h2>

    <div class="mb-3">
      <button class="btn btn-primary" @click="openAddModal">Add+</button>
    </div>

    <table class="table table-bordered table-striped">
      <thead class="table-primary">
        <tr>
          <th>ID</th>
          <th>ชื่อสินค้า</th>
          <th>รายละเอียด</th>
          <th>ราคา</th>
          <th>จำนวน</th>
          <th>รูปภาพ</th>
          <th>การจัดการ</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="product in products" :key="product.product_id">
          <td>{{ product.product_id }}</td>
          <td>{{ product.product_name }}</td>
          <td>{{ product.description }}</td>
          <td>{{ product.price }}</td>
          <td>{{ product.stock }}</td>
          <td>
            <img
              v-if="product.image"
              :src="'http://localhost/project-vuet2ww3/php_api/uploads/' + product.image"
              width="100"
            />
          </td>
          <td>
            <button class="btn btn-warning btn-sm me-2" @click="openEditModal(product)">
              แก้ไข
            </button>
            <button class="btn btn-danger btn-sm" @click="deleteProduct(product.product_id)">
              ลบ
            </button>
          </td>
        </tr>
      </tbody>
    </table>

    <div v-if="loading" class="text-center"><p>กำลังโหลดข้อมูล...</p></div>
    <div v-if="error" class="alert alert-danger">{{ error }}</div>

    <!-- Modal ใช้ทั้งเพิ่ม / แก้ไข -->
    <div class="modal fade" id="editModal" tabindex="-1">
      <div class="modal-dialog modal-md">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">{{ isEditMode ? "แก้ไขสินค้า" : "เพิ่มสินค้าใหม่" }}</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body">
            <form @submit.prevent="saveProduct">
              <div class="mb-3">
                <label class="form-label">ชื่อสินค้า</label>
                <input v-model="editForm.product_name" type="text" class="form-control" required />
              </div>
              <div class="mb-3">
                <label class="form-label">รายละเอียด</label>
                <textarea v-model="editForm.description" class="form-control"></textarea>
              </div>
              <div class="mb-3">
                <label class="form-label">ราคา</label>
                <input v-model="editForm.price" type="number" step="0.01" class="form-control" required />
              </div>
              <div class="mb-3">
                <label class="form-label">จำนวน</label>
                <input v-model="editForm.stock" type="number" class="form-control" required />
              </div>
              <div class="mb-3">
  <label class="form-label">รูปภาพ</label>
  <!-- ✅ required เฉพาะตอนเพิ่มสินค้า -->
  <input
    type="file"
    @change="handleFileUpload"
    class="form-control"
    :required="!isEditMode"
  />

  <!-- แสดงรูปเดิมเฉพาะตอนแก้ไข -->
  <div v-if="isEditMode && editForm.image">
    <p class="mt-2">รูปเดิม:</p>
    <img
      :src="'http://localhost/project-vuet2ww3/php_api/uploads/' + editForm.image"
      width="100"
    />
  </div>
</div>




              <button type="submit" class="btn btn-success">
                {{ isEditMode ? "บันทึกการแก้ไข" : "บันทึกสินค้าใหม่" }}
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from "vue";

export default {
  name: "ProductList",
  setup() {
    const products = ref([]);
    const loading = ref(true);
    const error = ref(null);
    const isEditMode = ref(false); // ✅ เช็คโหมด
    const editForm = ref({
      product_id: null,
      product_name: "",
      description: "",
      price: "",
      stock: "",
      image: ""
    });
    const newImageFile = ref(null);
    let modalInstance = null;

    // โหลดข้อมูลสินค้า
    const fetchProducts = async () => {
      try {
        const res = await fetch("http://localhost/project-vuet2ww3/php_api/api_product.php");
        const data = await res.json();
        products.value = data.success ? data.data : [];
      } catch (err) {
        error.value = err.message;
      } finally {
        loading.value = false;
      }
    };

// เปิด Modal สำหรับเพิ่มสินค้า
const openAddModal = () => {
  isEditMode.value = false;
  editForm.value = {
    product_id: null,
    product_name: "",
    description: "",
    price: "",
    stock: "",
    image: ""
  };
  newImageFile.value = null;
      
  const modalEl = document.getElementById("editModal");
  modalInstance = new window.bootstrap.Modal(modalEl);
  modalInstance.show();

  // ✅ รีเซ็ตค่า input file ให้ไม่แสดงชื่อไฟล์ค้าง
  const fileInput = modalEl.querySelector('input[type="file"]');
  if (fileInput) fileInput.value = "";
 };

// เปิด Modal สำหรับแก้ไขสินค้า
    const openEditModal = (product) => {
      isEditMode.value = true;
      editForm.value = { ...product };
      newImageFile.value = null;
      const modalEl = document.getElementById("editModal");
      modalInstance = new window.bootstrap.Modal(modalEl);
      modalInstance.show();
    };

    const handleFileUpload = (event) => {
      newImageFile.value = event.target.files[0];
    };

// ✅ ใช้ฟังก์ชันเดียวในการเพิ่ม / แก้ไข
    const saveProduct = async () => {
      const formData = new FormData();
      formData.append("action", isEditMode.value ? "update" : "add");
      if (isEditMode.value) formData.append("product_id", editForm.value.product_id);
      formData.append("product_name", editForm.value.product_name);
      formData.append("description", editForm.value.description);
      formData.append("price", editForm.value.price);
      formData.append("stock", editForm.value.stock);
      if (newImageFile.value) formData.append("image", newImageFile.value);

      try {
        const res = await fetch("http://localhost/project-vuet2ww3/php_api/api_product.php", {
          method: "POST",
          body: formData
        });
        const result = await res.json();
        if (result.message) {
          alert(result.message);
          fetchProducts();
          modalInstance.hide();
        } else if (result.error) {
          alert(result.error);
        }
      } catch (err) {
        alert(err.message);
      }
    };

    // ลบสินค้า
    const deleteProduct = async (id) => {
      if (!confirm("คุณแน่ใจหรือไม่ที่จะลบสินค้านี้?")) return;

      const formData = new FormData();
      formData.append("action", "delete");
      formData.append("product_id", id);

      try {
        const res = await fetch("http://localhost/project-vuet2ww3/php_api/api_product.php", {
          method: "POST",
          body: formData
        });
        const result = await res.json();
        if (result.message) {
          alert(result.message);
          products.value = products.value.filter((p) => p.product_id !== id);
        } else if (result.error) {
          alert(result.error);
        }
      } catch (err) {
        alert(err.message);
      }
    };

    onMounted(fetchProducts);

    return {
      products,
      loading,
      error,
      editForm,
      isEditMode,
      openAddModal,
      openEditModal,
      handleFileUpload,
      saveProduct,
      deleteProduct
    };
  }
};
</script>