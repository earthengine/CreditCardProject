<?php include 'admin_top.php'; ?>
<?php
$id = $_GET['bankid'];
$name = $_POST['bankname'];

$update = "UPDATE bank_info SET name='$name' WHERE id=$id";
$ru = mysqli_query($conn, $update);

if( !$ru ){
?>
<span class="failinfo">Update failed, please try again.</span><br/><br/>
<span class="redirectinfo"><a href="bank_info.php">Click here if your browser doesn't redirect automatically.</a></span>
<meta http-equiv="refresh" content="5;URL=bank_info.php" />
<?php include 'admin_footer.php'; ?>
<?php
	exit;
}
?>
<?php
$action = "update bank info for bank: ".$id;
update_action_logs($conn, $_SESSION['admin_name'], $action);
?>
<span class="successinfo">Update bank info successfully.</span><br/><br/>
<span class="redirectinfo"><a href="bank_info.php">Click here if your browser doesn't redirect automatically.</a></span>
<meta http-equiv="refresh" content="5;URL=bank_info.php" />
<?php include 'admin_footer.php'; ?>