class CreateIncomingMessages < ActiveRecord::Migration
  def change
    create_table :incoming_messages do |t|
      t.string :from
      t.string :to
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
      t.integer :album_id
      t.integer :width
      t.integer :height
      t.timestamps
    end
    add_index :incoming_messages, :album_id
  end
end
