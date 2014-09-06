function app1(){
  return "<div class=\"box-row-card\"><img src=\"image/cards/ANZ_Rewards_Black.jpg\" alt=\"ANZ Rewards Black\"><div class=\"div-text\">ANZ Rewards Black With AMEX ($4000)</div><input type=\"button\" value=\"delete\"/></div>";
}

function deleteCard(event){
	$(event.target).parent().remove();
}

$(document).ready(function(){
  $("#addCard").click(function(){
    var v1=$(app1());
    v1.children("input").click(deleteCard);
    $("#wallet").append(v1);
  });
  $("input[value=\"delete\"]").click(deleteCard);
});
