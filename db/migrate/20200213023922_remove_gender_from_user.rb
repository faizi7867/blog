class RemoveGenderFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :gender, :date
  end
end
