$(document).ready(function() {
	$(".fullHeight_home").css("min-height", $(window).height());
	$(".lightbox_thumb").hide();
	if ($(window).width() <= 992) {
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
	if (($(window).width() > 992) && !(isTouchSupported()))  {
		$(window).scroll(function() {
			if ($(this).scrollTop() > ($(window).height() - 55)) {
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
			  scrollTop: target.offset().top -50
			}, 1000);
			return false;
		  }
		}
	  });
	});
    
	//Gallery Video init 
	$('.gallery').featherlightGallery({
		previousIcon: '<img src="http://varareese.herokuapp.com/assets/left_arrow-0e8b9d9a893461b0050dc5a65f3d187ee03aae96b3ded430214b4de4ab13041a.png" class="featherlight_arrow" />',
    	nextIcon: '<img src="http://varareese.herokuapp.com/assets/right_arrow-cb9a19584e7ffb752070594185c74f0153795e16195881a2c4c2251abfd106f7.png" class="featherlight_arrow" />',
    	galleryFadeIn: 100,         
		galleryFadeOut: 300,
		afterOpen: function() {
			if ($(window).width() > 992) {
				$(".lightbox_thumb").show();
				
			}
		}, 
		beforeClose: function() {
			$(".lightbox_thumb").hide();
			
		}, 
		afterClose: function() {
			$.featherlight.close();
		}
	});

	

	//Gallery Photo Custom Buttons
	hermitage.navigationButtons.next.text = ">";
	hermitage.navigationButtons.previous.text = "<";

	

});