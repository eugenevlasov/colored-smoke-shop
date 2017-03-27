module CalculatorModule
  def total(cart_hash)
    goods     = Array.new
    cart_hash.each do |key, value|
      goods << key if value.to_i > 0
    end

    goods = Good.where(:id => goods)

    total = 0
    goods.each do |g|
      total += g.base_goods_description.cost * cart_hash[g.id.to_s]
    end

    total
  end
end
