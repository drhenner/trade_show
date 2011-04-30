class CreatePurchaseOrders < ActiveRecord::Migration
  def self.up
    create_table :purchase_orders do |t|
      t.integer :supplier_id,       :null => false
      t.string :invoice_number
      t.string :tracking_number
      t.string :notes
      t.string :state
      t.datetime :ordered_at,       :null => false
      t.date :estimated_arrival_on
      #t.boolean :is_received,       :null => false

      t.timestamps
    end

    add_index :purchase_orders, :supplier_id
    #add_index :purchase_orders, :tracking_number

    if nil
      execute('CREATE INDEX purchase_orders_invoice_number_ten ON purchase_orders (invoice_number(9));')
      execute('CREATE INDEX purchase_orders_tracking_number_ten ON purchase_orders (tracking_number(9));')
    else
      add_index :purchase_orders, :invoice_number
      add_index :purchase_orders, :tracking_number
    end
  end

  def self.down
    drop_table :purchase_orders
  end
end
