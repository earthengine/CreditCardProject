<?php
include 'include/dbconn.php';

$id = $_REQUEST['id'];

$select = "SELECT bank_id, card_name FROM card_info WHERE id = $id LIMIT 0, 1";
$rs = mysqli_query($conn, $select);

$row = mysqli_fetch_array($rs);

echo json_encode($row);
?>