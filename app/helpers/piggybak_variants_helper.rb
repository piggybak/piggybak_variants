module PiggybakVariantsHelper
  def variant_cart_form(object, options = {:controls => 'radio_buttons'})
    render "piggybak_variants/cart/#{options[:controls]}_form", :object => object
  end

  def options_for_klass(klass)
    options = ::PiggybakVariants::OptionConfiguration.where(klass: klass).includes(:option).collect { |oc| oc.option }
  end

  def variant_map(object)
    map = {}
    object.variants.includes(:piggybak_sellable).available.each do |variant|
      map[variant.option_values.hash_ordered.map { |ov| ov.id }.join('_')] = { :id => variant.piggybak_sellable.id, :price => number_to_currency(variant.piggybak_sellable.price) }
    end
    map.to_json
  end
end
