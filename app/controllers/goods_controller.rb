class GoodsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_good, only: [:edit, :update, :destroy]
  before_action :set_base_good_descriptions, only: [:new, :edit]

  # GET /goods
  def index
    @goods = Good.all.order(:id)
  end

  # GET /goods/new
  def new
    @good = Good.new
  end

  # GET /goods/1/edit
  def edit
  end

  # POST /goods
  def create
    @good = Good.new(good_params)

    if @good.save
      redirect_to goods_url, notice: 'Товар создан.'
    else
      format.html { render :new }
    end
  end

  # PATCH/PUT /goods/1
  def update
    if @good.update(good_params)
      redirect_to goods_url, notice: 'Товар изменен.'
    else
      render :edit
    end
  end

  # DELETE /goods/1
  def destroy
    @good.destroy

    redirect_to goods_url, notice: 'Товар удален.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_good
      @good = Good.find(params[:id])
    end

    def set_base_good_descriptions
      @base_goods_descriptions_array = BaseGoodsDescription.all.map { |bgd| [bgd.name, bgd.id] }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def good_params
      params.fetch(:good, {}).permit(:quantity, :color, :color_code)
    end
end
