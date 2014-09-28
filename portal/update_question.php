<?php include 'admin_top.php'; ?>
<?php
$id = $_POST['qid'];
$question = $_POST['question'];

$result = updateQuestion($conn, $id, $question);

if( $result == 0 ){
?>
<span class="failinfo">Update failed, please try again.</span><br/><br/>
<span class="redirectinfo"><a href="question_info.php">Click here if your browser doesn't redirect automatically.</a></span>
<meta http-equiv="refresh" content="5;URL=question_info.php" />
<?php include 'admin_footer.php'; ?>
<?php
	exit;
}
?>
<?php
$action = "update question: ".$id;
update_action_logs($conn, $_SESSION['admin_name'], $action);
?>
<span class="successinfo">Question has been updated successfully.</span><br/><br/>
<span class="redirectinfo"><a href="question_info.php">Click here if your browser doesn't redirect automatically.</a></span>
<meta http-equiv="refresh" content="5;URL=question_info.php" />
<?php include 'admin_footer.php'; ?>