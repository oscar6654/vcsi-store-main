Deface::Override.new(
  virtual_path: "spree/shared/_main_nav_bar",
  name: "add_link_to_users_sales",
  insert_after: "#home-link",
  text: "<li class='header-primary-nav-holder'><%= link_to 'Products On Sale', sale_path %></li>",
  sequence: { before: "auth_shared_login_bar"}
)

Deface::Override.new(
  virtual_path: "spree/shared/_main_nav_bar",
  name: "add_link_to_users_favorite_products",
  insert_after: "#home-link",
  text: "<% if spree_current_user %><li class='header-primary-nav-holder'><%= link_to 'Favorite Products', favorite_products_path %></li><% end %>",
  sequence: { before: "auth_shared_login_bar"}
)
