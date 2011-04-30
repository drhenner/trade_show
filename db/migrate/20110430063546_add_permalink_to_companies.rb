class AddPermalinkToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :permalink,          :string
  end

  def self.down
    remove_column :companies, :permalink
  end
end
