function app1(cont){
    var req = $.ajax({
	url: "interface/new_card.php",
	type: "GET",
	data: { id: 1 },
	dataType: "html"});
    req.done(cont);
}

function deleteCard(event){
	$(event.target).parent().remove();
}

$(document).ready(function(){
  $("#addCard").click(function(){
       app1(function(msg){
       var v1=$(msg);
       v1.children("input").click(deleteCard);
       $("#wallet").append(v1);
    });
  });
  $("input[value=\"delete\"]").click(deleteCard);
});
