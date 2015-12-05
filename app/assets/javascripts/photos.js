$(document).ready(function(){
	// disable auto discover
	Dropzone.autoDiscover = false;
	// grap our upload form by its id
		$(".dropzone").dropzone({
	// restrict image size to a maximum 1MB
			maxFilesize: 20,
	// changed the passed param to one accepted by
	// our rails app
			paramName: "photo[photo]",
	// show remove links on each image upload
			addRemoveLinks: false, 
			dictDefaultMessage: "Drag and Drop .... or just click anywhere"
		});	
});