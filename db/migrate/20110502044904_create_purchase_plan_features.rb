class CreatePurchasePlanFeatures < ActiveRecord::Migration
  def self.up
    create_table :purchase_plan_features do |t|
      t.integer :purchase_plan_id
      t.integer :feature_id

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_plan_features
  end
end
