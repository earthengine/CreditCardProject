function Wallet(){
	var cards = [];
	
	var findIdx(id){
		for(var i=0; i<cards.length; ++i){
			if(cards[i].id===id)
				return i;
		}
		return -1;
	}
	
	return {
		getCard : function(id){
			return cards[findIdx(id)];
		}
		addCard : function(id,monthly_spend,balance_percent,amex_percent){
			cards.push({"id":id,
				"monthly_spend":monthly_spend,
				"balance_percent":balance_percent,
				"amex_percent":amex_percent});				
		}
		updateCard : function(id,monthly_spend,balance_percent,amex_percent){
			var idx = findIdx(id);
			cards[idx].monthly_spend = monthly_spend;
			cards[idx].balance_percent = balance_percent;
			cards[idx].amex_percent = amex_percent;
		}
		deleteCard : function(id){
			cards.splice(idx,1);
		}
		toJson : function(){
			return JSON.stringify();
		}
	}
}