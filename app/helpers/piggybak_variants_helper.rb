module PiggybakVariantsHelper
  def variant_cart_form(object)
    render "piggybak_variants/cart/form", :object => object
  end

  def options_for_klass(klass)
    options = ::PiggybakVariants::OptionConfiguration.find_all_by_klass(klass).collect { |oc| oc.option }
  end
end
