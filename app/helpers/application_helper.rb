module ApplicationHelper
  include CalculatorModule

  def cart_counter
    return 0 unless cookies.signed[:cart]

    counter = 0
    cart_hash = JSON.parse(cookies.signed[:cart])
    cart_hash.each do |key, value|
      counter += value unless value.nil?
    end

    counter
  end

  def cart_total
    return 0 unless cookies.signed[:cart]

    total(JSON.parse(cookies.signed[:cart]))
  end

  def datetime_formatted(data)
    data.try(:strftime, '%Y-%m-%d %H:%M')
  end

  def is_active(route)
    'active' if request.path.try(:starts_with?, route)
  end
end
