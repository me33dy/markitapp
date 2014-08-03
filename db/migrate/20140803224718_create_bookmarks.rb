class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url, :null => false
      t.boolean :private

      t.timestamps
    end
  end
end
