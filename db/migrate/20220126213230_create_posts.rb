class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.boolean :published
      t.boolean :public
      t.timestamps
    end
  end
end
