class AddCategory2ToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :category_2, :string
  end
end
