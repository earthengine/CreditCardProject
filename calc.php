<?php
    include 'include/dbconn.php';
	
	function annual
	
 	function annual_points($data, $cardinfo){
 		$total_points = 0;
 		foreach ($data->cards as &$_cardspend){
 			$cardspend = $_cardspend;
 			//$cardinfo = card_calc_info($cardspend->id);

 			$amount_rest = $cardspend->monthly_spend;
 			foreach ($cardinfo->tiers as &$tier){
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
			echo $voucher_per_year . "\n";
 			if(is_null($cardinfo->IO_bonus_points))
 				$year1_earning = $voucher_per_year;
 			else
 				$year1_earning = $cardinfo->IO_bonus_points * 100.0
 					/ $cardinfo->points_myer100 + $voucher_per_year;
 			if(!is_null($cardinfo->IO_first_year_fee))
 				$year1_earning = $year1_earning - $cardinfo->IO_first_year_fee;
 			$year2_3earning = ($voucher_per_year
 				- $cardinfo->annual_fee - $cardinfo->rewards_fee) * 2;
 		}
 		
 		return array("total_points" => $total_points, 
 				"total_wallet_earnings" => $year1_earning + $year2_3earning);
 	}

 	function card_calc_info($id){
 		global $conn;
 		$select_card = "SELECT id,amex_card,purchase_interest_rate,".
 	 			"coalesce(annual_fee,0) as annual_fee,coalesce(rewards_fee,0) as rewards_fee,".
 	 			"IO_bonus_points,IO_first_year_fee,points_myer100 ".
 				"FROM card_info WHERE id = $id";
 		$rs = mysqli_query($conn, $select_card);
 		if( mysqli_num_rows($rs) != 0 ){
			$result = [];
			while($row_card = mysqli_fetch_array($rs)){
				$select_tier = "SELECT card_id,visa_points_per_dollar,amex_points_per_dollar, " .
							   "points_cap FROM card_tier_info WHERE card_id = $id ORDER BY " .
							   "tier ASC";
				$rs = mysqli_query($conn, $select_tier);
				$tiers = [];
				if( mysqli_num_rows($rs) != 0){
					$cnt = 0;
					while($row = mysqli_fetch_array($rs)){
						$tiers[$cnt] = (object)$row;
						$cnt = $cnt + 1;
					}
				} 			
				$row_card["tiers"] = $tiers;
				$result[$row_card['id']] = (object)$row_card;
			}
 			return $result;
 		}
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

	verify("1", json_decode(
			 '{"cards":[{"id":5,"monthly_spend":4000,"balance_percent":100,' .
			  '"amex_percent":20}],' .
			  '"answers":[1,2,1,1,1,1]}', false), 52800, 865.04304304304);
	verify("2", json_decode(
			 '{"cards":[{"id":13,"monthly_spend":8000,"balance_percent":100,' .
			  '"amex_percent":50}],' .
			  '"answers":[1,2,1,1,1,1]}', false), 102000, 1236.49);
	verify("3", json_decode(
			 '{"cards":[{"id":6,"monthly_spend":10000,"balance_percent":100,' .
			  '"amex_percent":50}],' .
			  '"answers":[1,2,1,1,1,1]}', false), 1800000, 1236.49);
?>