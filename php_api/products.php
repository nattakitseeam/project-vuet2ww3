<?php
include 'condb.php';

try {
    $stmt = $conn->query("SELECT * FROM products");
    $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($datas);
    
} catch (PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>
    