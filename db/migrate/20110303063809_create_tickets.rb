class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :subject
      t.string :status
      t.text :details
      t.integer :user_id
      t.integer :assigned_to_id
      t.integer :brand_id
      t.string :issue_type
      t.boolean :active, :default => true

      t.timestamps
    end
    if nil
      execute('CREATE INDEX tickets_subject_ten ON tickets (subject(10));')
    else
      add_index :tickets, :subject
    end
    add_index :tickets, :user_id
    add_index :tickets, :assigned_to_id
    add_index :tickets, :brand_id
  end

  def self.down
    drop_table :tickets
  end
end
