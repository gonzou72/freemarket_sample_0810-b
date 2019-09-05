class AddDefaultToItems < ActiveRecord::Migration[5.0]
  
    def up
      change_column_null :items, :category_1, false, 0
      change_column :items, :category_1, :string, default: 0
      change_column_null :items, :category_2, false, 0
      change_column :items, :category_2, :string, default: 0
    end
  
    def down
      change_column_null :items, :category_1, true, nil
      change_column :items, :category_1, :string, default: nil
      change_column_null :items, :category_2, true, nil
      change_column :items, :category_2, :string, default: nil
    end
  
end
