source 'https://rubygems.org/'
ruby "2.3.3"
gem 'rails', '~> 5.0.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails-ujs'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'coffee-rails'
gem 'spree', '~> 3.2.7'
gem 'spree_auth_devise', '~> 3.3'
gem 'spree_gateway', '~> 3.3'
gem 'spree_datashift_prod_import', github: 'vinsol-spree-contrib/spree_datashift_prod_import', branch: '3-2-stable'
gem 'datashift_spree', github: 'oscar6654/datashift_spree', branch: '3-2-edit'
gem 'datashift', github: 'vinsol-spree-contrib/datashift', branch: '3-2-stable'
gem 'spree_paypal_express', github: 'spree-contrib/better_spree_paypal_express'
gem 'spree_mail_settings', github: 'spree-contrib/spree_mail_settings'
gem 'aws-sdk', '< 2.0'
gem 'spree_better_terms_and_conditions', git: 'https://github.com/jamatthews/spree_better_terms_and_conditions.git', branch: 'master'
gem 'spree_cash_on_delivery', :git => 'https://github.com/mzegarek/spree_cash_on_delivery.git', branch: 'master'
# gem 'spree_html_invoice', git: 'https://github.com/vinsol-spree-contrib/spree-html-invoice.git', branch: '3-2-stable'
gem 'spree_admin_roles_and_access', git: 'https://github.com/oscar6654/spree_admin_roles_and_access.git'
gem 'spree-bank-transfer', require: 'spree_bank_transfer', github: 'oscar6654/spree_bank_transfer', branch: '3-2-updated'
gem 'spree_print_invoice', github: 'oscar6654/spree_print_invoice', branch: 'master'
gem 'spree_slider', github: 'oscar6654/spree_slider'
gem "spree_user_groups", github: 'oscar6654/spree_user_groups', branch: '3-2-upload'
gem 'spree_social', github: 'spree-contrib/spree_social'
gem 'spree_batch_products', github: 'oscar6654/spree-batch-products', branch: '3-2-stable'
gem 'spree_ajax_add_to_cart', github: 'oscar6654/spree_ajax_add_to_cart', branch: '3-2-stable'
gem 'sprockets-helpers', '~> 1.2.1'
gem 'spree_sales', github: 'oscar6654/spree_sales', branch: '3-2-stable'
gem 'spree_reffiliate', github: 'vinsol-spree-contrib/spree_reffiliate'
gem 'paymaya', github: 'oscar6654/paymaya-ruby-sdk'
gem 'spree_paymaya', github: 'oscar6654/spree_paymaya'

# gem 'vinsol_spree_themes', github: 'vinsol-spree-contrib/spree_themes', branch: '3-2-stable'
gem 'utf8-cleaner'
gem 'slack-notifier'

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'capybara'
  gem 'launchy', require: false
  gem 'pry-rails'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-matchers', require: false
  gem 'valid_attribute'
end

group :production do
  gem 'rails_12factor'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
