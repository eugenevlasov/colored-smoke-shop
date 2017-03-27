class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:new, :create, :status]

  # GET /orders
  def index
    @orders = Order.all.order(id: :desc)
  end

  # GET /orders/1
  def show
    goods = Array.new
    @cart_hash = JSON.parse @order[:cart]
    @cart_hash.each do |key, value|
      goods << key if value.to_i > 0
    end

    @goods    = Good.where(:id => goods)
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    new_order = order_params
    new_order[:cart] = cookies.signed[:cart]
    @order = Order.create(new_order)

    if @order.save
      cookies.delete :cart
      NotificationMailer.order_confirmation(@order).deliver_now

      redirect_to order_status_path(@order), notice: 'Заказ сформирован'
    else
      redirect_to cart_path, alert: 'Не удалось сделать заказ'
    end
  end

  # PATCH/PUT /orders/1
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def status
    @order = Order.find_by(:id => params[:order_id])
  end

  def change
    if order = Order.where(:id => params[:order_id]).take
      case params[:status].to_i
      when 1, 2, 3
        order.update(status: params[:status])
        redirect_to order, notice: 'Статус заказа изменен'
      else
        redirect_to order, alert: 'Недопустимый статус заказа!'
      end
    else
      redirect_to orders_path, alert: 'Заказ не существует!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:email, :phone, :person, :address, :delivery_option_id, :status, :cart)
    end
end
