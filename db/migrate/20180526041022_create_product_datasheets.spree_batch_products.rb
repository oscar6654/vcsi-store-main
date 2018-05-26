# This migration comes from spree_batch_products (originally 20110209183557)
class CreateProductDatasheets < ActiveRecord::Migration
  def self.up
    create_table :product_datasheets do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :product_datasheets
  end
end
