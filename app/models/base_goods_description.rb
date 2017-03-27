class BaseGoodsDescription < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :goods,  :dependent => :destroy
  has_many :images, :dependent => :destroy

  def in_hand
    self[:in_hand] ? 'Да' : 'Нет'
  end

  def total_colors
    Good.where(:base_goods_description_id => self.id).count
  end
end
