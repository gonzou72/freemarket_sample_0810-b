class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string      :name            ,null:false
      t.text        :detail          ,null:false
      t.integer     :price           ,null:false
      t.string      :size            ,null:false
      t.string      :brand
      t.string      :condition       ,null:false
      t.string      :shipping_fee    ,null:false
      t.string      :shipping_method ,null:false
      t.string      :ship_out_area   ,null:false
      t.string      :ship_out_date   ,null:false
      t.string      :category_id     ,null:false
      t.references  :user            ,foreign_key: true,null:false
      t.references  :status          ,foreign_key: true
      t.timestamps                   
    end
  end
end