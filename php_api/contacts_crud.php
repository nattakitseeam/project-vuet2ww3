<?php
include 'condb.php';
header("Content-Type: application/json; charset=UTF-8");

try {
    $method = $_SERVER['REQUEST_METHOD'];

    // ✅ ดึงข้อมูลพนักกงานทั้งหมด
    if ($method === "GET") {
        $stmt = $conn->prepare("SELECT * FROM contacts ORDER BY contact_id DESC");
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode(["success" => true, "data" => $result]);
    }

    // ✅ เพิ่มข้อมูลพนักกงาน
    elseif ($method === "POST") {
        // ตรวจสอบว่าข้อมูลมาจาก JSON หรือ form-data
        $contentType = $_SERVER["CONTENT_TYPE"] ?? '';

        if (stripos($contentType, "application/json") !== false) {
            $data = json_decode(file_get_contents("php://input"), true);
        } else {
            $data = $_POST;
        }

        // ตรวจสอบค่าว่าง
        if (empty($data["subject"]) || empty($data["detail"]) || empty($data["fullname"]) || empty($data["email"])) {
            echo json_encode(["success" => false, "message" => "กรุณากรอกข้อมูลให้ครบ"]);
            exit;
        }


        // เพิ่มข้อมูลลูกค้า
        $stmt = $conn->prepare("INSERT INTO contacts (subject, detail, fullname, email)
                                VALUES (:subject, :detail, :fullname, :email)");

        $stmt->bindParam(":subject", $data["subject"]);
        $stmt->bindParam(":detail", $data["detail"]);
        $stmt->bindParam(":fullname", $data["fullname"]);
        $stmt->bindParam(":email", $data["email"]);
      

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "เพิ่มReportเรียบร้อย"]);
        } else {
            echo json_encode(["success" => false, "message" => "ส่งข้อมูลReportไม่สำเร็จ"]);
        }
    }

    // ✅ แก้ไขข้อมูล
    elseif ($method === "PUT") {
        $data = json_decode(file_get_contents("php://input"), true);

        if (!isset($data["contact_id"])) {
            echo json_encode(["success" => false, "message" => "ไม่พบค่า contact_id"]);
            exit;
        }

        $contact_id = intval($data["contact_id"]);

            $sql = "UPDATE contacts 
                    SET subject = :subject, 
                        detail = :detail, 
                        fullname = :fullname, 
                        email = :email
                    WHERE contact_id = :id";
        

        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":subject", $data["subject"]);
        $stmt->bindParam(":detail", $data["detail"]);
        $stmt->bindParam(":fullname", $data["fullname"]);
        $stmt->bindParam(":email", $data["email"]);
        if (!empty($data["password"])) {
            $stmt->bindParam(":password", $password_hash);
        }
        $stmt->bindParam(":id", $contact_id, PDO::PARAM_INT);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "แก้ไขข้อมูลเรียบร้อย"]);
        } else {
            echo json_encode(["success" => false, "message" => "ไม่สามารถแก้ไขข้อมูลได้"]);
        }
    }

    // ✅ ลบข้อมูล
    elseif ($method === "DELETE") {
        $data = json_decode(file_get_contents("php://input"), true);

        if (!isset($data["contact_id"])) {
            echo json_encode(["success" => false, "message" => "ไม่พบค่า contact_id"]);
            exit;
        }

        $stmt = $conn->prepare("DELETE FROM contacts WHERE contact_id = :id");
        $stmt->bindParam(":id", $data["emp_id"], PDO::PARAM_INT);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "ลบข้อมูลเรียบร้อย"]);
        } else {
            echo json_encode(["success" => false, "message" => "ไม่สามารถลบข้อมูลได้"]);
        }
    }

    else {
        echo json_encode(["success" => false, "message" => "Method ไม่ถูกต้อง"]);
    }

} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
}
?>
