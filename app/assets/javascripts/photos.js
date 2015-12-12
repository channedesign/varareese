$(document).ready(function(){
	
	Dropzone.autoDiscover = false;
	
	$(".dropzone").dropzone({
		maxFilesize: 20,
		paramName: "photo[photo]",
		addRemoveLinks: false, 
		dictDefaultMessage: "Drag and Drop .... or just click anywhere"
	});	

	


    // Set up any event handlers
    $(".dropzone").on('success', function () {
        window.location.href = ("/photo")
    });
    

});

