class Order < ApplicationRecord
  include CalculatorModule

  belongs_to  :delivery_option
  has_many    :reserves,  :dependent => :destroy

  before_save :setup_reserves

  def delivery_option
    DeliveryOption.find_by(:id => self.delivery_option_id).description
  end

  def status
    case self[:status]
    when 0
      'Новый'
    when 1
      'В работе'
    when 2
      'Выполнен'
    when 3
      'Отмена/Отказ'
    end
  end

  protected
    def setup_reserves
      case self[:status]

      when 0
        Reserve.transaction do
          JSON.parse(self[:cart]).each do |key, value|
            Reserve.create(:order_id  => self[:id],
                           :good_id   => key,
                           :quantity  => value) if value.to_i > 0
          end
        end

        self[:cost]           = total(JSON.parse(self[:cart]))
        self[:delivery_cost]  = DeliveryOption.find_by(:id => self[:delivery_option_id]).cost

      when 1
      when 2
        Reserve.transaction do
          Good.transaction do
            Reserve.where(order_id: self[:id]).each do |reservation|
              good = Good.find(reservation[:good_id])
              good.update!(quantity: good.quantity - reservation.quantity)
            end
          end

          Reserve.where(order_id: self[:id]).destroy_all
        end

      when 3
        Reserve.transaction do
          Reserve.where(order_id: self[:id]).destroy_all
        end

      else
      end
    end
end
