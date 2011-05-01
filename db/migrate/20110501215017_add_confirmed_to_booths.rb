class AddConfirmedToBooths < ActiveRecord::Migration
  def self.up
    add_column :booths, :confirmed, :boolean, :default => false
  end

  def self.down
    remove_column :booths, :confirmed
  end
end
