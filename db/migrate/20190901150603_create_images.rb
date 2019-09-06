class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string     :image1 , null: false
      t.string     :image2 , null: false
      t.string     :image3 , null: false
      t.string     :image4 , null: false
      t.string     :image5 , null: false
      t.string     :image6 , null: false
      t.string     :image7 , null: false
      t.string     :image8 , null: false
      t.string     :image9 , null: false
      t.string     :image10, null: false
      t.references :item,    null: false, foreigen_key: true
      t.timestamps         null: false
    end
  end
end
