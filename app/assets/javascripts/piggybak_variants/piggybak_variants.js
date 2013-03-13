$(function() {
	$('.variant_options input[type=radio]').click(function() { piggybak_variants.toggle_variant_form(); });
	piggybak_variants.toggle_variant_form();	
});

var piggybak_variants = {
	toggle_variant_form: function() {	
		$('.unavailable, .all_selected').hide();
		var all_selected = true;
		var selected = new Array();
		$.each($('.option'), function(i, j) {
			var option_id = $(j).attr('id');
			if($('input[name=' + option_id + ']:checked').length) {
				selected.push($('input[name=' + option_id + ']:checked').val());
			} else {
				all_selected = false;	
			}
		});
		var selected_key = selected.sort().join('_');
		if(all_selected && variant_map[selected_key]) {
			$('.variant_options form').show();
			$('#sellable_id').val(variant_map[selected_key].id);
			$('#variant_price span').html(variant_map[selected_key].price);
		} else if(all_selected) { // if all selected and not available
			$('.variant_options form').hide();
			$('.unavailable').show();
		} else { // if not all selected
			$('.all_selected').show();
			$('.variant_options form').hide();
		}
	}
};
