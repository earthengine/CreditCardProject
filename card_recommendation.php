<?php
include 'include/dbconn.php';

$select = "SELECT id, COALESCE(image_url,CONCAT(card_name,'.jpg')) AS image, referral_url, card_name FROM card_info order by Rand() LIMIT 10";
$rs = mysqli_query($conn, $select);
if( mysqli_num_rows($rs) != 0 ){
	while( $row = mysqli_fetch_array($rs) ){
	?>
	<div id="card_recom_<?php echo $row['id']; ?>" class="card-entry">
		<img class="card-image" src="image/cards/<?php echo $row['image'] ?>"/>
		<span class="card-description"><?php echo $row['card_name']; ?></span>
		<a href="<?php echo $row['referral_url']; ?>">Apply</a>
	</div>
	<?php
	}
}
?>
