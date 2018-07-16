

Deface::Override.new(
  virtual_path: 'spree/home/index',
  name: 'add_quote_to_mobile',
  insert_bottom: "[data-hook='homepage_products']",
  partial: 'spree/shared/add_quote_to_mobile'
)
