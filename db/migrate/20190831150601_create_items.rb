class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.srting      :name           ,null:false
      t.text        :dtails         ,null:false
      t.integer     :price          ,null:false
      t.integer     :size           ,null:false
      t.integer     :condition      ,null:false
      t.integer     :shipping_fee   ,null:false
      t.srting      :shipping_method,null:false
      t.srting      :ship_out_area  ,null:false
      t.srting      :ship_out_date  ,null:false
      t.references  :user_id        ,null:false,foreign_key:true
      t.references  :brand_id       ,null:false,foreign_key:true
      t.references  :status_id      ,null:false,foreign_key:true
      end
      t.timestamps                   null:false
    end
  end
end
