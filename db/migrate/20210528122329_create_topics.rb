class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :topic_name, null: false
      t.text :topic_content, null: false
      t.timestamps
    end
  end
end
