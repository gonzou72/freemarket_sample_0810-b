class AddCategory3ToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :category_3, :string
  end
end
