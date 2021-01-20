class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end

    add_index :topics, :name, unique: true
  end
end
