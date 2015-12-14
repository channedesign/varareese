$(document).ready(function() {


	$(".fullHeight").css("max-height", $(window).height());

	//Carousel
	function owl(x) {
		x.owlCarousel({
			items: 4,
			pagination: false,
			video: true,
			loop: true
		});
	}
	function owl2(x) {
		x.owlCarousel({
			autoplay: 3000,
			items: 5,
			pagination: false,
			loop: true,
			autoplayHoverPause: true
		});
	}
	var owlFashion = $(".video_carousel_fashion");
	var owlEditorial = $(".video_carousel_editorial");
	var owlBehind = $(".video_carousel_behind");
	var owlWeek = $(".video_carousel_week");
	var owlShort = $(".video_carousel_short");
	owl(owlFashion);
	owl(owlEditorial);
	owl(owlBehind);
	owl(owlWeek);
	owl(owlShort);

	var owlHead = $(".photo_carousel_head");
	var owlEvent = $(".photo_carousel_event");
	var owlRecreation = $(".photo_carousel_recreation");
  	owl2(owlHead);
  	owl2(owlEvent);
  	owl2(owlRecreation);
	

	//Carousel triggers
	function arrow(x,y,z) {
		$(x).click(function() {
			y.trigger('prev.owl.carousel');
		});
		$(z).click(function() {
			y.trigger('next.owl.carousel');
		});
	}

	arrow(".left_arrow_fashion", owlFashion, ".right_arrow_fashion");
	arrow(".left_arrow_editorial", owlEditorial, ".right_arrow_editorial");
	arrow(".left_arrow_behind", owlBehind, ".right_arrow_behind");
	arrow(".left_arrow_week", owlWeek, ".right_arrow_week");
	arrow(".left_arrow_short", owlShort, ".right_arrow_short");

	arrow(".left_arrow_head", owlHead, ".right_arrow_head");
	arrow(".left_arrow_event", owlEvent, ".right_arrow_event");
	arrow(".left_arrow_recreation", owlRecreation, ".right_arrow_recreation");


  	

  	function arrowHover(x, y) {
  		$(x).hover(function() {
	  		$(".left_arrow_" + y).fadeIn("slow");
	  		$(".right_arrow_" + y).fadeIn("slow");
	  	}, function() {
	  		$(".left_arrow_" + y).fadeOut("slow");
	  		$(".right_arrow_" + y).fadeOut("slow");
	  	});
  	}

  	var anchorFashion = $(".anchor_video_fashion");
  	var anchorEditorial = $(".anchor_video_editorial");
  	var anchorBehind = $(".anchor_video_behind");
  	var anchorWeek = $(".anchor_video_week");
  	var anchorShort = $(".anchor_video_short");
  	var anchorHead = $(".anchor_photo_head");
  	var anchorEvent = $(".anchor_photo_event");
  	var anchorRecreation = $(".anchor_photo_recreation");

  	arrowHover(anchorFashion, "fashion");
  	arrowHover(anchorEditorial, "editorial");
  	arrowHover(anchorBehind, "behind");
  	arrowHover(anchorWeek, "week");
  	arrowHover(anchorShort, "short");
  	arrowHover(anchorHead, "head");
  	arrowHover(anchorEvent, "event");
  	arrowHover(anchorRecreation, "recreation");

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