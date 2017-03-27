class AddSlugToBaseGoodsDescriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :base_goods_descriptions, :slug, :string
    add_index :base_goods_descriptions, :slug, unique: true
  end
end
