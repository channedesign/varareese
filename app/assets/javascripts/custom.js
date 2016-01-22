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
		previousIcon: '<img src="https://s3.amazonaws.com/varareesebucket/arrows/left_arrow_white.png" class="featherlight_arrow" />',
    	nextIcon: '<img src="https://s3.amazonaws.com/varareesebucket/arrows/right_arrow_white.png" class="featherlight_arrow" />',
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
	if ($(window).width > 767) {
		hermitage.navigationButtons.next.styles = { width: '50px', height: '150px', backgroundImage: 'url(https://s3.amazonaws.com/varareesebucket/arrows/right_arrow_white.png)', backgroundSize: "cover",backgroundPosition: "right", top: "40%" };
		hermitage.navigationButtons.previous.styles = { width: '50px', height: '150px', backgroundImage: 'url(https://s3.amazonaws.com/varareesebucket/arrows/left_arrow_white.png)', backgroundSize: "cover",backgroundPosition: "left", top: "40%" };
	} else {
		hermitage.navigationButtons.next.styles = { width: '20px', height: '70px', backgroundImage: 'url(https://s3.amazonaws.com/varareesebucket/arrows/right_arrow_white.png)', backgroundSize: "cover",backgroundPosition: "right", top: "45%" };
	hermitage.navigationButtons.previous.styles = { width: '20px', height: '70px', backgroundImage: 'url(https://s3.amazonaws.com/varareesebucket/arrows/left_arrow_white.png)', backgroundSize: "cover",backgroundPosition: "left", top: "45%" };
	}
	
	hermitage.navigationButtons.next.text = "";
	hermitage.navigationButtons.previous.text = "";

});