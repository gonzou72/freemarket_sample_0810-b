class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.binary     :image ,limit:10.megabyte
      t.references :item,   foreigen_key: true
      t.timestamps
    end
  end
end