# This migration comes from spree_batch_products (originally 20111021125405)
class AddUserIdToProductDatasheets < ActiveRecord::Migration
  def self.up
    add_column :product_datasheets, :user_id, :integer
  end

  def self.down
    remove_column :product_datasheets, :user_id
  end
end
