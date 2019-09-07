class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string      :name            
      t.text        :detail         
      t.integer     :price           
      t.integer     :size            
      t.string      :brand
      t.integer     :condition       
      t.integer     :shipping_fee    
      t.string      :shipping_method 
      t.string      :ship_out_area   
      t.string      :ship_out_date   
      t.references  :user            ,foreign_key: true
      t.references  :status          ,foreign_key: true
      t.timestamps                   
    end
  end
end