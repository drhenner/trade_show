class CreateBoothFeatures < ActiveRecord::Migration
  def self.up
    create_table :booth_features do |t|
      t.integer :booth_id,    :null => false
      t.integer :feature_id,  :null => false

    end
  end

  def self.down
    drop_table :booth_features
  end
end
