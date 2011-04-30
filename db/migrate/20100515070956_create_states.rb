class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|

      t.string :name,                       :null => false
      t.string :abbreviation, :limit => 5,  :null => false,   :unique => true
      t.string :described_as
      t.integer :country_id,                :null => false
      t.integer :shipping_zone_id,          :null => false
    end
    #
    if nil
      execute('CREATE INDEX states_name_ten ON states (name(8));')
    else
      add_index :states, :name
    end
    add_index :states, :country_id
    add_index :states, :abbreviation
  end

  def self.down
    drop_table :states
  end
end
