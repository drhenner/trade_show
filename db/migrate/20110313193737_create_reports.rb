class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.integer   :reportable_id
      t.string    :reportable_type
      t.string    :document_file_name
      t.string    :document_content_type
      t.integer   :document_file_size
      t.datetime  :document_updated_at

      t.timestamps
    end
    add_index :reports, :reportable_id
  end

  def self.down
    drop_table :reports
  end
end
