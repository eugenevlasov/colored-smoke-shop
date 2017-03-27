class NotificationMailer < ApplicationMailer
  default bcc: Rails.application.config.site_email_punycode

  def order_confirmation(order)
    @order = order
    goods = Array.new
    @cart_hash = JSON.parse @order[:cart]
    @cart_hash.each do |key, value|
      goods << key if value.to_i > 0
    end

    @goods = Good.where(:id => goods)
    @total = 0
    @goods.each do |g|
      @total += g.base_goods_description.cost * @cart_hash[g.id.to_s]
    end

    mail(to: order.email, subject: "Заказ № #{order.id} на сайте ЦветнойДым.рф")
  end
end
