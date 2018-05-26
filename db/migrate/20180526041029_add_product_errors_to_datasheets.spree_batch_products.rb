# This migration comes from spree_batch_products (originally 20120816125140)
class AddProductErrorsToDatasheets < ActiveRecord::Migration
  def self.up
    add_column :spree_product_datasheets, :product_errors, :text
  end

  def self.down
    remove_column :spree_product_datasheets, :product_errors
  end
end
