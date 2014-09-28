<?php
include '../../include/dbconn.php';

$select = "SELECT id, name FROM bank_info ORDER BY id";
$rs = mysqli_query($conn, $select);
if( mysqli_num_rows($rs) != 0 ){
	while( $row = mysqli_fetch_array($rs) ){
	?>
	<option value="<?php echo $row['id']; ?>"><?php echo $row['name']; ?></option>
	<?php
	}
}
?>