<?php
session_start();
date_default_timezone_set('Australia/Melbourne');
include '../include/dbconn.php';

$username = $_POST['username'];
$password = sha1($_POST['password']);

$select = "SELECT * FROM cc_admin WHERE cca_username='$username' AND cca_pwd='$password' LIMIT 0, 1";
$rs = mysqli_query($conn, $select);

if( !$rs || mysqli_num_rows($rs) != 1 ){
?>
<meta http-equiv="refresh" content="3;URL=index.php" />
<?php
	exit("<span style=\"font-family:'Courier New';\">&gt;&gt;&nbsp;Login failed.</span>");
}
$nowtime = date("Y-m-d H:i:s");
$insert = "INSERT INTO cc_admin_login_logs (cca_username, login_time) VALUES ('$username', '$nowtime')";
$ri = mysqli_query($conn, $insert);

if( $ri ){
	$_SESSION['admin_name'] = $username;
	$_SESSION['is_admin'] = 1;
?>
<meta http-equiv="refresh" content="0;URL=menu.php" />
<?php
}
?>