class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :base_goods_description, foreign_key: true
      t.text :alt
      t.text :title

      t.timestamps
    end
  end
end
