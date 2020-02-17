class RemoveTitleFromPostcommnet < ActiveRecord::Migration[5.2]
  def up
    remove_column :postcomments, :title
  end
end
