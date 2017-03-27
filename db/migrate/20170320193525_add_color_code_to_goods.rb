class AddColorCodeToGoods < ActiveRecord::Migration[5.0]
  def change
    add_column :goods, :color_code, :text
  end
end
