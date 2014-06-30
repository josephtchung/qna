class RemoveTagsFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :tags, :string
  end
end
