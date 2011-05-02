class CreatePurchasePlans < ActiveRecord::Migration
  def self.up
    create_table :purchase_plans do |t|
      t.string  :name
      t.decimal :price,             :precision => 8, :scale => 2
      t.date    :start_date
      t.date    :end_date
      t.text    :description
      t.boolean :active, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_plans
  end
end
