$(document).ready(function() {

	showLevel('one', '');

	var levelTwoEvents = [];

	$('.event-name').click(function(){
		scopeId = '#' + $(this).parents('.event-info').attr('id');
		pos = $.inArray(scopeId, levelTwoEvents);
		if(pos >= 0) {
			levelTwoEvents.splice(pos, 1);
			showLevel('one', scopeId);
		}
		else {
			levelTwoEvents.push(scopeId);
			showLevel('two', scopeId);
		}

	});

});

function showLevel(layer,scopeId){
	console.log(scopeId);
	$(scopeId + ' .hide-on-level-' + layer).hide('slow');
	$(scopeId + ' .show-on-level-' + layer).show('slow');
}

