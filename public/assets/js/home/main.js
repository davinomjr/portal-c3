$('#carousel').carousel({
  interval: 2000
});

$(document).ready(function () {
	$(".carousel-inner").swiperight(function () {
		$(this).parent().carousel('prev');
	});
	$(".carousel-inner").swipeleft(function () {
		$(this).parent().carousel('next');
	});
});