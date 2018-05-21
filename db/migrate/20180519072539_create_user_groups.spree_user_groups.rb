# This migration comes from spree_user_groups (originally 20110207075544)
class CreateUserGroups < ActiveRecord::Migration
  def self.up
    create_table :spree_user_groups do |t|
      t.string  :name
    end
    change_table :spree_users do |t|
      t.integer :user_group_id
    end
  end

  def self.down
    change_table :spree_users do |t|
      t.remove :user_group_id
    end
    drop_table :spree_user_groups
  end
end
