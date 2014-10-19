function Wallet(){
	var cards = [];
	var uicards = [];
	
	var findIdx = function(id){
		for(var i=0; i<cards.length; ++i){
			if(cards[i].id===id)
				return i;
		}
		return -1;
	}
	
	return {
		getUiCard : function(id){
			return uicards[findIdx(id)];
		},
		getCard : function(id){
			return cards[findIdx(id)];
		},
		addCard : function(uicard){
			cards.push({"id":uicard.id,
				"monthly_spend":uicard.ams,
				"balance_percent":uicard.bpem,
				"amex_percent":uicard.psa});
			uicards.push(uicard);
		},
		updateCard : function(uicard){
			var idx = findIdx(uicard.id);
			cards[idx].monthly_spend = uicard.ams;
			cards[idx].balance_percent = uicard.bpem;
			cards[idx].amex_percent = uicard.psa;
			uicards[idx] = uicard;
		},
		deleteCard : function(uicard){
			var idx = findIdx(uicard.id);
			cards.splice(idx,1);
			uicards.splice(idx,1);
		},
		toServer : function(){
			return {"cards":cards};
		},
		fromServer : function(json_obj){
			cards = json_obj.cards;
		}
	}
}