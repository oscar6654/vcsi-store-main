class AddFeaturedProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_products, :featured, :boolean, default: false
  end
end
