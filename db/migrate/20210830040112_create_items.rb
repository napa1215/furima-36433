class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,            null: false
      t.text       :text,            null: false
      t.integer    :price,           null: false
      t.integer    :delivery_fee_id, null: false
      t.integer    :area_id,         null: false
      t.references :user,            foreign_key: true
      t.timestamps null: false
    end
  end
end
