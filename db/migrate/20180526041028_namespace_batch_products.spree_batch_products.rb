# This migration comes from spree_batch_products (originally 20120315201521)
class NamespaceBatchProducts < ActiveRecord::Migration
  def up
    rename_table :product_datasheets, :spree_product_datasheets
  end

  def down
    rename_table :spree_product_datasheets, :product_datasheets
  end
end
