class CreatePostcomments < ActiveRecord::Migration[5.2]
  def change
    create_table :postcomments do |t|
      t.string :title
      t.text :body
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
