<?php
include 'condb.php'; // ไฟล์เชื่อมต่อ DB



$data = json_decode(file_get_contents("php://input"), true);

$username = $data['username'] ?? '';
$password = $data['password'] ?? '';

if (!$username || !$password) {
    echo json_encode([
        "success" => false,
        "message" => "กรอกข้อมูลไม่ครบ"
    ]);
    exit;
}

try {
    $stmt = $conn->prepare("SELECT * FROM employee WHERE username = :username");
    $stmt->bindParam(":username", $username);
    $stmt->execute();

    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {

        // ✅ กรณีใช้ password_hash()
        if (password_verify($password, $user['password'])) {

            echo json_encode([
                "success" => true,
                "message" => "Login สำเร็จ",
                "user" => [
                    "id" => $user['emp_id'],
                    "name" => $user['firstName'] . " " . $user['lastName'],
                    "username" => $user['username']
                ]
            ]);

        } else {
            echo json_encode([
                "success" => false,
                "message" => "รหัสผ่านไม่ถูกต้อง"
            ]);
        }

        /*
        ❗ ถ้ายังใช้ plain text (ไม่แนะนำ)
        if ($password === $user['password']) { ... }
        */

    } else {
        echo json_encode([
            "success" => false,
            "message" => "ไม่พบผู้ใช้งาน"
        ]);
    }

} catch (PDOException $e) {
    echo json_encode([
        "success" => false,
        "message" => $e->getMessage()
    ]);
}