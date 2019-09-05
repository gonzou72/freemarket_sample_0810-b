class AddCategory1ToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :category_1, :string
  end
end
