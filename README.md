PiggybakVariants Gem (Engine)
========

Advanced variant support for Piggybak.

Install
========

In your Gemfile add `gem "piggybak_variants"`

Run `bundle install`

Run `rake piggybak_variants:install:migrations`
Migrate the DB `rake db:migrate`

Add `acts_as_sellable_with_variants` to any model that should have variants. You may need to add appropriate attr_accessible settings in your model as well, depending on your attribute accessibility settings.

In the admin, define option configurations and option values for each option, then create variants for your sellable instances.

Finally, add `<%= variant_cart_form(@instance) %>` to your sellable item's show page to render the cart form.

OPTION:  `<%= variant_cart_form(@instance, :controls => 'dropdowns') %>` to render dropdowns instead of radio buttons.


TODO
========

* Notes specified in variant.rb


Copyright
========

Copyright (c) 2012 End Point. See LICENSE for further details.
