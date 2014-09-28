<?php include 'admin_top.php'; ?>
<?php
$qid = $_POST['qid'];
$aid = $_POST['aid'];
$answer = $_POST['answer'];
$order = $_POST['order'];

$result = updateAnswer($conn, $qid, $aid, $answer, $order);

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
$action = "update answer ".$aid." of question ".$qid;
update_action_logs($conn, $_SESSION['admin_name'], $action);
?>
<span class="successinfo">Answer has been updated successfully.</span><br/><br/>
<span class="redirectinfo"><a href="question_info.php">Click here if your browser doesn't redirect automatically.</a></span>
<meta http-equiv="refresh" content="5;URL=question_info.php" />
<?php include 'admin_footer.php'; ?>