class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name
      t.string :abbreviation, :limit => 5
    end
    #
    if nil
      execute('CREATE INDEX countries_name_ten ON countries (name(8));')
    else
      add_index :countries, :name
    end
    if SETTINGS[:use_foreign_keys]
      execute "alter table states add constraint fk_states_countries foreign key (country_id) references countries(id)"
    end
  end

  def self.down
    execute "alter table states drop foreign key fk_states_countries" if SETTINGS[:use_foreign_keys]
    drop_table :countries
  end
end
