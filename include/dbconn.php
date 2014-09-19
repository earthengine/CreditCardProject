<?php
$conn = mysqli_connect("localhost","root","");
//$conn = mysqli_connect("118.145.6.21","s221907","xR8!hTv#");
if( !$conn ){
	exit("<span style=\"font-family:'Courier New';\">&gt;&gt;&nbsp;database connection error.0.1<br/>&gt;&gt;&nbsp;....0.1<br/>&gt;&gt;&nbsp;please contact administrator.</span>");
	//echo "";
}
mysqli_select_db($conn, "credit_card_project");
mysqli_query($conn, "SET CHARACTER SET utf8");
?>
