class AddUserRefToBookmarks < ActiveRecord::Migration
  def change
    add_reference :bookmarks, :user, index: true
  end
end
