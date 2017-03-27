class CartsController < ApplicationController
  before_action :setup_cart
  attr_reader :cart_hash

  def show
    goods = Array.new
    cart_hash.each do |key, value|
      goods << key if value.to_i > 0
    end

    @goods    = Good.where(:id => goods)
    @order    = Order.new
    @delivery = DeliveryOption.where(:status => true)
  end

  def add
    if Good.find_by(:id => params[:id]).available > 1
      cart_hash[params[:id]] = if cart_hash[params[:id]].nil? || cart_hash[params[:id]] == 0
        1
      else
        if cart_hash[params[:id]] < Good.find_by(:id => params[:id]).available
          cart_hash[params[:id]] + 1
        else
          cart_hash[params[:id]]
        end
      end

      cookies.permanent.signed[:cart] = JSON.generate(cart_hash)
    end

    @id       = params[:id]
    @quantity = cart_hash[params[:id]]
  end

  def remove
    cart_hash[params[:id]] = if cart_hash[params[:id]].nil? || cart_hash[params[:id]] == 0
      0
    else
      cart_hash[params[:id]] - 1 if cart_hash[params[:id]] > 0
    end

    cookies.permanent.signed[:cart] = JSON.generate(cart_hash)

    @id       = params[:id]
    @quantity = cart_hash[params[:id]]
  end

  private
    def setup_cart
      @cart_hash = if cookies.signed[:cart]
        JSON.parse(cookies.signed[:cart])
      else
        Hash.new
      end
    end
end
