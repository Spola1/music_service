class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.float  :length
      t.float :filesize
      t.integer :downloads_count, default: 0
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
