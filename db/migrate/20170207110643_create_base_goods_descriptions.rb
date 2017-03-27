class CreateBaseGoodsDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :base_goods_descriptions do |t|
      t.text :name
      t.text :description
      t.text :country
      t.text :youtube_link
      t.boolean :in_hand
      t.text :base
      t.integer :burning_time
      t.integer :height
      t.integer :diameter
      t.integer :cost

      t.timestamps
    end
  end
end
