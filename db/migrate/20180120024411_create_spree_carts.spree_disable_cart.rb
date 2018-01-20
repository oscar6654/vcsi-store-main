# This migration comes from spree_disable_cart (originally 20150528080028)
class CreateSpreeCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_carts do |t|
      t.boolean :cart_status, default: false
      # t.timestamps
    end
    ActiveRecord::Base.connection.execute("INSERT INTO spree_carts (cart_status) VALUES (false)")
  end
end
