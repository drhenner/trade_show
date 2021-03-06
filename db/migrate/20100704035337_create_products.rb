class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string            :name,                  :null => false
      t.text              :description
      t.text              :product_keywords
      t.integer           :tax_category_id
      t.integer           :product_type_id,       :null => false
      t.integer           :prototype_id
      t.integer           :shipping_category_id,  :null => false
      t.integer           :tax_status_id,         :null => false
      t.string            :permalink,             :null => false,   :unique => true
      t.datetime          :available_at
      t.datetime          :deleted_at
      t.string            :meta_keywords
      t.string            :meta_description
      t.boolean           :featured,          :default => false
      #t.integer           :count_on_hand
      t.timestamps
    end
      #
      if nil
        execute('CREATE INDEX products_name_ten ON products (name(9));')
        execute('CREATE INDEX products_permalink_ten ON products (permalink(15));')
      else
        add_index :products, :name
        add_index :products, :permalink#,   :unique => true
      end
      add_index :products, :tax_category_id
      add_index :products, :product_type_id
      add_index :products, :shipping_category_id
      add_index :products, :prototype_id
      #

  end

  def self.down
    drop_table :products
  end
end
