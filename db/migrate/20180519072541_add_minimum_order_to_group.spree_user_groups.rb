# This migration comes from spree_user_groups (originally 20120928180355)
class AddMinimumOrderToGroup < ActiveRecord::Migration
  def up
    add_column :spree_user_groups, :minimum_order, :int, :default => 0
  end

  def down
    remove_column :spree_user_groups, :minimum_order
  end
end
