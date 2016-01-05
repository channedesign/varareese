$(document).ready(function() {
	$(".fullHeight_home").css("min-height", $(window).height());
	if ($(window).width() <= 990) {
		$(".to_home").attr("href", "#home")
	}

	

	//Detect if touch device
	function isTouchSupported() {
	    var msTouchEnabled = window.navigator.msMaxTouchPoints;
	    var generalTouchEnabled = "ontouchstart" in document.createElement("div");
	 
	    if (msTouchEnabled || generalTouchEnabled) {
	        return true;
	    }
	    return false;
	}

	//nav
	if (($(window).width() > 990) && !(isTouchSupported()))  {
		$(window).scroll(function() {
			if ($(this).scrollTop() > ($(window).height() - 50)) {
				$("#nav").fadeIn("slow");
			} else {
				$("#nav").fadeOut("slow");
			}
		});
		$(".to_home").click(function() {
			$("body").animate({scrollTop: 0}, 1500);
			return false;
		});
	}
	//remove mobile nav on click
	$('.navbar-collapse a').click(function (e) {
        $('.navbar-collapse').collapse('toggle');
    });
	

	//SmoothScrolling
	$(function() {
	  $('a[href*=#]:not([href=#])').click(function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
		  var target = $(this.hash);
		  target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
		  if (target.length) {
			$('html,body').animate({
			  scrollTop: target.offset().top
			}, 1000);
			return false;
		  }
		}
	  });
	});
    
	    


});