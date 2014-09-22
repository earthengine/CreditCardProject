<?php
include 'include/dbconn.php';

$card = $_GET['card'];

$select = "SELECT COALESCE(image_url,CONCAT(REPLACE(card_name,' ', '_'),'.jpg')) AS image FROM card_info WHERE id = $card ORDER BY id";
$rs = mysqli_query($conn, $select);
$row = mysqli_fetch_array($rs);
echo $row['image'];
?>