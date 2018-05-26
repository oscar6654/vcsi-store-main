# This migration comes from spree_batch_products (originally 20110214012445)
class AddDeletedAtColumnToProductDatasheets < ActiveRecord::Migration
  def self.up
    add_column :product_datasheets, :deleted_at, :datetime
  end

  def self.down
    remove_column :product_datasheets, :deleted_at
  end
end
