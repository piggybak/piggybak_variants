PiggybakVariants Gem (Engine)
========

Advanced variant support for Piggybak.

Install
========

In your Gemfile add `gem "piggybak_variants"`

Run `bundle install`

Run `rake piggybak_variants:install:migrations` in your main Rails application.
Migrate the DB `rake db:migrate`

Add //= require piggybak_variants/piggybak_variants-application to your application.js

Add `acts_as_sellable_with_variants` to any model that should have variants. You may need to add appropriate attr_accessible settings in your model as well, depending on your attribute accessibility settings.

In the admin, define option configurations and option values for each option, then create variants for your sellable instances.

Finally, add `<%= variant_cart_form(@instance) %>` to your sellable item's show page to render the cart form. To use dropdowns instead of radio buttons, call `<%= variant_cart_form(@instance, :controls => 'dropdowns') %>`

Copyright
========

Copyright (c) 2014 End Point. See LICENSE for further details.
