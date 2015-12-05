$(document).ready(function() {

	$(".fullHeight").css("max-height", $(window).height());

	//Video carousel
	var owl = $(".video_carousel");
	var owl2 = $(".photo_carousel");
	owl.owlCarousel({
		autoPlay: 5000,
		items: 4,
		pagination: false
	});
	//Video carousel triggers
	$(".left_arrow_pic_div").click(function(){
    	owl.trigger('owl.prev');
  	})
  	$(".right_arrow_pic_div").click(function(){
    	owl.trigger('owl.next');
  	})
  	owl2.owlCarousel({
		autoPlay: 3000,
		items: 5,
		pagination: false, 
		autoHeight: true
	});

  	$(".anchor_video").hover(function() {
  		$(".arrow_pic_div").fadeIn("slow");
  	}, function() {
  		$(".arrow_pic_div").fadeOut("slow");
  	});

	//nav
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$("#nav").fadeIn("slow");
		} else {
			$("#nav").fadeOut("slow");
		}
	});

	//SmoothScrolling
    $(function() {
	  $('a[href*=#]:not([href=#])').click(function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
		  var target = $(this.hash);
		  target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
		  if (target.length) {
			$('html,body').animate({
			  scrollTop: target.offset().top - 50
			}, 1000);
			return false;
		  }
		}
	  });
	});





});