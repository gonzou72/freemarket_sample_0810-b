class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_code     ,null: false
      t.integer     :prefecture      ,null: false, default: 0
      t.string      :city            ,null: false
      t.string      :street          ,null: false
      t.string      :building_name
      t.string      :phone
      t.references  :user            ,foreign_key: true
      t.timestamps                    null:false
    end
  end
end
