<?php
function update_action_logs($conn, $admin, $action){
	$result = 1;
	$nowtime = date("Y-m-d H:i:s");
	$insert = "INSERT INTO cc_admin_action_logs (admin_event, action_by, action_time) VALUES ('$action', '".$admin."', '$nowtime')";
	$ri = mysqli_query($conn, $insert);
	if( !$ri ){
		$result = 0;
	}
	return $result;
}

function getQuestions($conn){
	$select = "SELECT id, description, type FROM questions ORDER BY id";
	$rs = mysqli_query($conn, $select);
	$q = array();
	while( $row = mysqli_fetch_array($rs) ){
		array_push($q, array($row['id'], $row['description'], $row['type']));
	}
	return $q;
}

function getAnswers($conn, $qid){
	$select = "SELECT `id`, `description`, `order` FROM answers WHERE qid = $qid ORDER BY `order`";
	$rs = mysqli_query($conn, $select);
	$a = array();
	while( $row = mysqli_fetch_array($rs) ){
		array_push($a, array($row['id'], $row['description'], $row['order']));
	}
	return $a;
}

function updateQuestion($conn, $id, $d){
	$update = "UPDATE questions SET description = '$d' WHERE id = $id";
	$ru = mysqli_query($conn, $update);
	if( !$ru ){
		return 0;
	}else{
		return 1;
	}
}

function updateAnswer($conn, $qid, $id, $d, $o){
	$update0 = "UPDATE answers SET `order` = `order`+1 WHERE qid = $qid AND `order` >= $o";
	$ru0 = mysqli_query($conn, $update0);
	if( $ru0 ){
		return 0;
	}
	
	$update = "UPDATE answers SET `description` = '$d', `order` = $o WHERE id = $id";
	$ru = mysqli_query($conn, $update);
	if( !$ru ){
		return 0;
	}else{
		return 1;
	}
}
?>