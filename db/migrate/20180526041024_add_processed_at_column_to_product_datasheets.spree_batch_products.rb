# This migration comes from spree_batch_products (originally 20110213172901)
class AddProcessedAtColumnToProductDatasheets < ActiveRecord::Migration
  def self.up
    add_column :product_datasheets, :processed_at, :datetime
  end

  def self.down
    remove_column :product_datasheets, :processed_at
  end
end
