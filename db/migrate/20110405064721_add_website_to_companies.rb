class AddWebsiteToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :website,        :string
    add_column :companies, :full_markdown,  :text
    add_column :companies, :email,          :string
  end

  def self.down
    remove_column :companies, :website
    remove_column :companies, :full_markdown
    remove_column :companies, :email
  end
end
