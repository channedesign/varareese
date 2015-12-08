$(document).ready(function(){
	// disable auto discover
	Dropzone.autoDiscover = false;
	
		$(".dropzone").dropzone({

			maxFilesize: 20,
	// changed the passed param to one accepted by
	// our rails app
			paramName: "photo[photo]",
	// show remove links on each image upload
			addRemoveLinks: false, 
			dictDefaultMessage: "Drag and Drop .... or just click anywhere"
		});	

		
    
   
        // Set up any event handlers
        $(".dropzone").on('completemultiple', function () {
            location.reload();
        });
    

});

