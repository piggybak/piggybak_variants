function refreshControls(all_selected, selected_key){
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
};

function extractRadioButtonValues(){
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
	return {all_selected: all_selected, selected: selected};
};
     
function extractDropdownValues(){     
  var all_selected = true;
  $('.variant_options select').each(function() { 
      if ($(this).attr('value') == '') {
        all_selected = false;
      }
  });
  var selected = new Array();
  $.each($('.option'), function(i, j) {
   var option_id = $(j).attr('id');
   var select_id = $(j).children("select").attr('id');
   if($('select#' + select_id + ' option:selected')) {
     selected.push($('select#' + select_id + ' option:selected').val());
   } else {
     all_selected = false; 
   }
  }); 
  return {all_selected: all_selected, selected: selected};
};  

function toggleVariantForm(){
  $('.unavailable, .all_selected').hide();
  var selected_values = {};  
  if ($('input[type=radio]').length > 0){
     selected_values = extractRadioButtonValues();
  }   
  else{
      selected_values = extractDropdownValues();
  };
	var selected_key = selected_values['selected'].sort().join('_');
	refreshControls(selected_values['all_selected'], selected_key);
};

$(function() {
	$('.variant_options input[type=radio]').click(function() { toggleVariantForm(); });
	$('.variant_options select').change(function() { toggleVariantForm(); });
	toggleVariantForm();
});

