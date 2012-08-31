// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .


$(document).ready(function() {
	$(".event-name-dottify").dotdotdot({
		ellipsis    : '... ',
		wrap      : 'word',
		after     : null,
		watch     : true,
		height      : 30,
		tolerance   : 0,
		callback    : function( isTruncated, orgContent ) {},
		lastCharacter : {
			remove      : [ ' ', ',', ';', '.', '!', '?' ],
			noEllipsis    : []
		}
	});
});


$(document).ready(function() {
	$(".event-description-dottify").dotdotdot({
		ellipsis    : '... ',
		wrap      : 'word',
		after     : '.more-details',
		watch     : true,
		height      : 200,
		tolerance   : 0,
		callback    : function( isTruncated, orgContent ) {},
		lastCharacter : {
			remove      : [ ' ', ',', ';', '.', '!', '?' ],
			noEllipsis    : []
		}
	});
});

