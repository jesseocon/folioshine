$(document).ready(function(){
	jQuery('.nailthumb-container img').imgpreload({
	    each: function(){
	      $(this).parents('.nailthumb-container').nailthumb({width:225,height:225, fitDirection: 'top left', preload:false});
	    }, all: function(){
	    }
	});
});
