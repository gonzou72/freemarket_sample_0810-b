class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string      :name            ,null: false
      t.text        :details         ,null: false
      t.integer     :price           ,null: false
      t.integer     :size            ,null: false
      t.integer     :condition       ,null: false
      t.integer     :shipping_fee    ,null: false
      t.string      :shipping_method ,null: false
      t.string      :ship_out_area   ,null: false
      t.string      :ship_out_date   ,null: false
      t.references  :user            ,null: false, foreign_key: true
      t.references  :brand           ,null: false, foreign_key: true
      t.references  :status          ,null: false, foreign_key: true
    
      t.timestamps                   null:false
    end
  end
end
