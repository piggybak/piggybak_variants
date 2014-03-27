var piggybak_variants = {
	refreshControls : function(data) {
		if(data.all_selected) { // if all selected
			var selected_key = data.selected.sort().join('_');
			if(variant_map[selected_key]) {
				$('.variant_options form').show();
				$('#sellable_id').val(variant_map[selected_key].id);
				$('#variant_price span').html(variant_map[selected_key].price);
			} else { // if variant not available
				$('.variant_options form').hide();
				$('.unavailable').show();
			}
		} else { // if not all selected
			$('.all_selected').show();
			$('.variant_options form').hide();
		}
	},
	extractRadioButtonValues: function() {
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
		return { all_selected: all_selected, selected: selected };
	},
	extractDropdownValues: function() {
		var all_selected = true;
		// TODO: Nice to see if easier way to select by value, but select[value=""] doesn't work
		$('.variant_options select').each(function() {
			if ($(this).val() == '') {
				all_selected = false;
			}
		});
		if(!all_selected) {
			return { all_selected: false, selected: '' };
		}
		
		var selected = new Array();
		$.each($('.variant_options .option select'), function(i, j) {
			selected.push($(this).val());
		});
		return { all_selected: true, selected: selected};
	},
	toggleVariantForm: function() {
		$('.unavailable, .all_selected').hide();
		var data;
		if ($('.variant_options input[type=radio]').length > 0){
			data = piggybak_variants.extractRadioButtonValues();
		} else { 
			data = piggybak_variants.extractDropdownValues();
		};
		piggybak_variants.refreshControls(data);
	}
}

$(function() {
	$('.variant_options input[type=radio]').click(function() { piggybak_variants.toggleVariantForm(); });
	$('.variant_options select').change(function() { piggybak_variants.toggleVariantForm(); });
	if($('.variant_options').size() > 0) {
		piggybak_variants.toggleVariantForm();
	}
});

