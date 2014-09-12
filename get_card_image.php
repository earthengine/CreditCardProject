<?php
include 'include/dbconn.php';

$card = $_GET['card'];

$select = "SELECT card_name FROM card_info WHERE id = $card ORDER BY id";
$rs = mysqli_query($conn, $select);
$row = mysqli_fetch_array($rs);
echo $row['card_name'];
?>