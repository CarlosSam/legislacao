$("#0 .btn").click(function(event){
	$("#1").removeClass("hidden");
});

$("#1 .btn").click(function(event){
	$("#2").removeClass("hidden");
});

$("#2 .btn").click(function(event){
	$("#3").removeClass("hidden");
});

$("#3 .btn").click(function(event){
	$("#4").removeClass("hidden");
});

$("#show-details").click(function(event){
	$("#details").removeClass("hidden");
	$("#show-details").addClass("hidden");
});
