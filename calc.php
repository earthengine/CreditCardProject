<?php
    include 'include/dbconn.php';
    
    function sort_cards($data, $cardinfos){
    	$card_earnings = array();
    	foreach ($cardinfos as &$cardinfo){
    		$earnings = earning($data, $cardinfo);
			foreach ($earnings as &$earning){
				if(!array_key_exists($earning["compare_id"], $cardinfos)
					|| $card_earnings[$earning["compare_id"]] < 
						$earning["total_wallet_earnings"]){
					$card_earnings[$earning["compare_id"]] =$earning["total_wallet_earnings"]; 
				}
			}
    	}
    	arsort($card_earnings);
    	reset($card_earnings);
    	return $card_earnings;
    }

 	function earning($data, $cardinfo){
 		$result = array();
 		$idx = 0;
 		foreach ($data->cards as &$_cardspend){
 			if(is_null($cardinfo->points_myer100))
 				continue;
 			
 			$cardspend = $_cardspend;			
 			$amount_rest = $cardspend->monthly_spend;
 			foreach ($cardinfo->tiers as &$tier){
 				if(is_null($avg_points_per_dollar))
 					break;			
 				if($cardinfo->amex_card=="1"){
	 				$avg_points_per_dollar = ($tier->visa_points_per_dollar * 
	 					(100.0 - $cardspend->amex_percent) + $tier->amex_points_per_dollar *
	 					$cardspend->amex_percent)/100.0;
 				} else {
 					$avg_points_per_dollar = $tier->visa_points_per_dollar;
				}
 				if(is_null($tier->points_cap) ||
	 						$amount_rest<=$tier->points_cap / $avg_points_per_dollar){
	 					$total_points = $total_points + $amount_rest * $avg_points_per_dollar;
	 					$amount_rest = 0;
	 					break;
	 			}
 				$total_ponts = $total_points + $tier->points_cap;
				$amount_rest = $amount_rest - $cap_amount;				
 			}
 			$total_points = $total_points * 12;
 			$voucher_per_year = $total_points * 100.0 / $cardinfo->points_myer100;
 			if(is_null($cardinfo->IO_bonus_points))
 				$year1_earning = $voucher_per_year;
 			else
 				$year1_earning = $cardinfo->IO_bonus_points * 100.0
 					/ $cardinfo->points_myer100 + $voucher_per_year;
 			if(!is_null($cardinfo->IO_first_year_fee))
 				$year1_earning = $year1_earning - $cardinfo->IO_first_year_fee;
 			$year2_3earning = ($voucher_per_year
 				- $cardinfo->annual_fee - $cardinfo->rewards_fee) * 2;
 			$result[$idx] = array("wallet_id" => $card->id,
 				"compare_id" => $cardinfo->id, 
 				"total_points" => $total_points, 
 				"total_wallet_earnings" => $year1_earning + $year2_3earning);
 		}
 		return $result;
 	}
 	
 	function card_name($id){
 		global $conn;
 		$select_card = "SELECT id, card_name FROM card_info WHERE id=" . $id;
 		$rs_card = mysqli_query($conn, $select_card);
 		if(mysqli_num_rows($rs_card)!=0){
 			$result = mysqli_fetch_array($rs_card); 
 			return $result["card_name"];
 		}
 	}

 	function card_calc_infos(){
 		global $conn;
 		$select_card = "SELECT id,amex_card,purchase_interest_rate,".
 	 			"coalesce(annual_fee,0) as annual_fee,coalesce(rewards_fee,0) as rewards_fee,".
 	 			"IO_bonus_points,IO_first_year_fee,points_myer100 ".
 				"FROM card_info";
 		$rs_card = mysqli_query($conn, $select_card);
 		$result = array(); 		
 		if( mysqli_num_rows($rs_card) != 0 ){ 			
 			while($card = mysqli_fetch_array($rs_card)){
	 			$select_tier = "SELECT card_id,visa_points_per_dollar,amex_points_per_dollar, " .
	 	 					   "points_cap FROM card_tier_info WHERE card_id = "
	 	 					   	. $card["id"] . " ORDER BY " .
	 						   "tier ASC";
	 			$rs = mysqli_query($conn, $select_tier);
	 			$tiers = array();
	 			if( !$rs || mysqli_num_rows($rs) != 0){
	 				$cnt = 0;
	 				while($row = mysqli_fetch_array($rs)){
	 					$tiers[$cnt] = (object)$row;
	 					$cnt = $cnt + 1;
	 				}
	 			}
	 			$card["tiers"] = $tiers;
	 			$result[$card["id"]] = (object)$card;
 			}
 		}
 		return $result;
 	}
 	
 	function amount_compare($a, $b){
 		return abs($a - $b) > 0.0001;
 	}
 	
 	function verify($case, $data, $expected_points, $expected_earning){
 		$result = annual_points($data);
 		if($result["total_points"]!=$expected_points){
 			echo($case);
 			var_dump($data);
 			var_dump($result);
 			die("total_points");
 		}
 		if(amount_compare($result["total_wallet_earnings"],$expected_earning)){
 			echo($case);
 			var_dump($data);
 			var_dump($result);
 			die("total_wallet_earnings");
 		}
 		echo "case " . $case . " passed\n";
 	}
 	
 	$cinfo = card_calc_infos();
 	echo card_name(key(sort_cards(json_decode(
			 '{"cards":[{"id":11,"monthly_spend":4000,"balance_percent":100,' .
			  '"amex_percent":20}],' .
			  '"answers":[1,2,1,1,1,1]}', false),$cinfo)));

//	verify("1", json_decode(
//			 '{"cards":[{"id":5,"monthly_spend":4000,"balance_percent":100,' .
//			  '"amex_percent":20}],' .
//			  '"answers":[1,2,1,1,1,1]}', false), 52800, 865.04304304304);
//	verify("2", json_decode(
//			 '{"cards":[{"id":13,"monthly_spend":8000,"balance_percent":100,' .
//			  '"amex_percent":50}],' .
//			  '"answers":[1,2,1,1,1,1]}', false), 102000, 1236.49);
//	verify("3", json_decode(
//			 '{"cards":[{"id":6,"monthly_spend":10000,"balance_percent":100,' .
//			  '"amex_percent":50}],' .
//			  '"answers":[1,2,1,1,1,1]}', false), 1800000, 1236.49);
?>