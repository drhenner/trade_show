class CreateBrands < ActiveRecord::Migration
  def self.up
    create_table :brands do |t|
      t.string      :name
    end
    if nil
      execute('CREATE INDEX brands_name_ten ON brands (name(9));')
    else
      add_index :brands, :name
    end
  end

  def self.down
    drop_table :brands
  end
end
