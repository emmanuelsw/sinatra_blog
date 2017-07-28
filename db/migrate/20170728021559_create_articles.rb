class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :user, index: true, null: false
      t.timestamps
    end
    add_foreign_key :articles, :users, column: :user_id
  end
end
