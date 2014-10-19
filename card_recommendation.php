<?php
session_start();
include 'include/dbconn.php';
include 'include/calc.php';

if(isset($_REQUEST["wallet"])){
	$wallet = json_decode(str_replace("\\\"","\"",$_REQUEST["wallet"]),false);
	$_SESSION["wallet"] = $wallet;
} else if(isset($_SESSION["wallet"])){
	$wallet = $_SESSION["wallet"];
}

if(isset($wallet) && sizeof($wallet->cards)>0){
	$cis = card_calc_infos();
	$sorted = sort_cards($wallet, $cis);
}
	
if(isset($sorted) && sizeof($sorted)>0){
	
    $result = "(";
	$cnt = 0;
    foreach ($sorted as $id => $card_earning){
    	$cnt = $cnt+1;
    	if($cnt==10)
    		break;
    	$result = $result . $id . ',';
    }
    $result = preg_replace('/,$/',')',$result);

	$select = "SELECT id, COALESCE(image_url,CONCAT(card_name,'.jpg')) AS image, ".
			"referral_url, card_name FROM card_info WHERE id in " . $result;
} else {
	$select = "SELECT id, COALESCE(image_url,CONCAT(card_name,'.jpg')) AS image, referral_url, card_name FROM card_info order by Rand() LIMIT 10";
}
$rs = mysqli_query($conn, $select);
$result = array();
if( mysqli_num_rows($rs) != 0 ){
	while( $row = mysqli_fetch_array($rs) ){
		$result[$row['id']] = (object)$row;
	}
	foreach ($result as &$card){
		?>
		<div id="card_recom_<?php echo $card->id; ?>" class="card-entry">
			<img class="card-image" src="image/cards/<?php echo $card->image ?>"/>
			<span class="card-description"><?php echo $card->card_name; ?></span>
			<a href="<?php echo $card->referral_url; ?>">Apply</a>
		</div><?php
	}
}


