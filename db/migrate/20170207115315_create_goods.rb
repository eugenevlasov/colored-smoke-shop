class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods do |t|
      t.references :base_goods_description, foreign_key: true
      t.text :color
      t.integer :quantity

      t.timestamps
    end
  end
end
