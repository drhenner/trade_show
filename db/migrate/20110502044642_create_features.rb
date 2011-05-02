class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.string :name
      t.text    :description
      t.decimal :price
      t.date    :start_date
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :features
  end
end
