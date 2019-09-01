class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.integer   :status, null: false
      t.reference :item  , null: false, foreign_key: true
      t.timestamps
    end
  end
end
