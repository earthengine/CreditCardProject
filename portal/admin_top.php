<?php
session_start();
date_default_timezone_set('Australia/Melbourne');
include '../include/dbconn.php';
include 'include/admin_func.php';
if( empty($_SESSION['is_admin']) || empty($_SESSION['admin_name']) || $_SESSION['is_admin'] != 1 ){
	session_destroy();
?>
<meta http-equiv="refresh" content="0;URL=index.php" />
<?php
	exit;
}
?>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/admin.css" />
<title>- Admin portal -</title>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script language="javascript">
function checkLogout(){
	var r = confirm("Confirm logout?");
	return r;
}
function checkDelete(){
	var r = confirm("Confirm delete?");
	return r;
}
</script>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tbody>
    <tr>
      <td id="top-nav" align="right">
      Welcome, <?php echo $_SESSION['admin_name']; ?>&nbsp;|&nbsp;<a href="menu.php">Menu</a>&nbsp;|&nbsp;<a href="logout.php" onclick="return checkLogout()" id="logout">Logout</a>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td align="center">