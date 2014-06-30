class CreateElders < ActiveRecord::Migration
  def change
    create_table :elders do |t|
      t.integer :user_id
      t.string :name
      t.integer :age
      t.string :sex
      t.string :relationship

      t.timestamps
    end
    add_index :elders, :user_id
  end
end
