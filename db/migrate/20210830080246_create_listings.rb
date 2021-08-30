class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string  :title
      t.text    :text
      t.integer :genre_id
      t.integer :condition_id
      t.integer :delivery_fee_id
      t.integer :prefecture_id
      t.integer :delivery_time_id
      t.timestamps
    end
  end
end
