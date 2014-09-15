<?php
function randomkeys($length){
	$key="";
	$pattern = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
	for($i=0; $i<$length; $i++){
		$key .= $pattern{mt_rand(0,61)};
	}
	return $key;
}

function GetIP(){
	$cip="";
	if(!empty($_SERVER["HTTP_CLIENT_IP"])){
		$cip = $_SERVER["HTTP_CLIENT_IP"];
	}elseif(!empty($_SERVER["HTTP_X_FORWARDED_FOR"])){
		$cip = $_SERVER["HTTP_X_FORWARDED_FOR"];
	}elseif(!empty($_SERVER["REMOTE_ADDR"])){
		$cip = $_SERVER["REMOTE_ADDR"];
	}else{
		$cip = "-.-.-.-";
	}
	return $cip;
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
	$select = "SELECT `id`, `description`, `order` FROM answers WHERE qid=$qid ORDER BY `order`";
	$rs = mysqli_query($conn, $select);
	$a = array();
	while( $row = mysqli_fetch_array($rs) ){
		array_push($a, array($row['id'], $row['description'], $row['order']));
	}
	return $a;
}
?>