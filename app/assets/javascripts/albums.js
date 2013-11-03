$(document).ready(function(){
	jQuery('.nailthumb-container img').imgpreload({
	    each: function(){
	      $(this).parents('.nailthumb-container').nailthumb({width:225,height:225, fitDirection: 'top left', preload:false});
	    }, all: function(){
	    }
	});
	
	jQuery('nailthumb-container-wide img').imgpreload({
		each: function(){
			$(this).parents('nailthumb-container-wide').nailthumb({width:350, height:350, fitDirection: 'top left', preload:false});
		}, all: function(){
		}
	});
	
	$('.muther').colorbox({rel: 'muther', maxHeight:'500px', scalePhotos:true});
	$('.nav-button').on('click', function(e){
		window.location = $(this).data('target');
	});
	
});
