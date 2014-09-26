<?php
include 'include/dbconn.php';

$select = "SELECT id, image_url, referral_url, card_name FROM card_info ORDER BY id";
$rs = mysqli_query($conn, $select);
if( mysqli_num_rows($rs) != 0 ){
	while( $row = mysqli_fetch_array($rs) ){
	?>
	<div id="card_recom_<?php echo $row['id']; ?>" class="card-entry">
		<img class="card-image" src="image/cards/<?php echo $row['image_url'] ?>"/>
		<span class="card-description"><?php echo $row['card_name']; ?></span>
		<a href="<?php echo $row['referral_url']; ?>">Apply</a>
	</div>
	<?php
	}
}
?>
