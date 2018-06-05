# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# Note: If a preference is set here it will be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will not make the preference value go away.
#       Instead you must either set a new value or remove entry, clear cache, and remove database entry.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
require 'lib/spree/product_filters'
Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
  # config.currency = "PHP"
  Spree::Config[:auto_capture_on_dispatch] = true
  # country = Spree::Country.find_by_name('Philippines')
  # config.default_country_id = country.id if country.present?
  config.allow_guest_checkout = false
  # Custom logo for the frontend
  config.logo = "logo/vcsi.png"
  # Custom logo for the admin
  config.admin_interface_logo = "logo/vcsi.png"
  config.products_per_page = 12
end

Spree.user_class = "Spree::User"
