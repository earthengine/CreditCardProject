<?php include 'admin_top.php'; ?>
<?php
$name = $_POST['bankname'];

$insert = "INSERT INTO bank_info (name) VALUES ('$name')";
$ri = mysqli_query($conn, $insert);

if( !$ri ){
?>
<span class="failinfo">Add new bank failed, please try again.</span><br/><br/>
<span class="redirectinfo"><a href="bank_info.php">Click here if your browser doesn't redirect automatically.</a></span>
<meta http-equiv="refresh" content="5;URL=bank_info.php" />
<?php include 'admin_footer.php'; ?>
<?php
	exit;
}
?>
<?php
$action = "add a new bank info for bank: ".$name;
update_action_logs($conn, $_SESSION['admin_name'], $action);
?>
<span class="successinfo">Add new bank info successfully.</span><br/><br/>
<span class="redirectinfo"><a href="bank_info.php">Click here if your browser doesn't redirect automatically.</a></span>
<meta http-equiv="refresh" content="5;URL=bank_info.php" />
<?php include 'admin_footer.php'; ?>