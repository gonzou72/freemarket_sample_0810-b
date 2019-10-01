class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string      :name            
      t.text        :detail          
      t.integer     :price           
      t.string      :size            
      t.string      :brand
      t.string      :condition       
      t.string      :shipping_fee    
      t.string      :shipping_method 
      t.string      :ship_out_area   
      t.string      :ship_out_date   
      t.string      :category_id     
      t.references  :user            ,foreign_key: true
      t.references  :image           ,foreign_key: true
      t.references  :status          ,foreign_key: true
      t.timestamps                   
    end
  end
end