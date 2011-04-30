class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name, :limit => 30, :null => false,   :unique => true
    end
    #
    if nil
      execute('CREATE INDEX roles_name_ten ON roles (name(6));')
    else
      add_index :roles, :name
    end
  end

  def self.down
    drop_table :roles
  end
end
