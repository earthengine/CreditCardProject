<?php
include 'include/dbconn.php';

$bank = $_GET['bank'];

$select = "SELECT id, card_name FROM card_info WHERE bank_id = $bank ORDER BY id";
$rs = mysqli_query($conn, $select);
if( mysqli_num_rows($rs) != 0 ){
	while( $row = mysqli_fetch_array($rs) ){
	?>
	<option value="<?php echo $row['id']; ?>"><?php echo $row['card_name']; ?></option>
	<?php
	}
}
?>