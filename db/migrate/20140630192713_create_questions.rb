class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.text :content
      t.string :tags

      t.timestamps
    end
    add_index :questions, :user_id
  end
end
