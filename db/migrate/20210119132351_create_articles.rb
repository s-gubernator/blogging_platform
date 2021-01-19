class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
