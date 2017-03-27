class Good < ApplicationRecord
  belongs_to :base_goods_description

  def available
    self[:quantity] - Reserve.where(:good_id => self[:id]).sum(:quantity)
  end

  def reserved
    Reserve.where(:good_id => self[:id]).sum(:quantity)
  end
end
