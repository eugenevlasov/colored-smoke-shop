class BaseGoodsDescriptionsController < ApplicationController
  before_action :set_base_goods_description,  only:   [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!,         except: [:show, :index]
  before_action :setup_cart,                  only:   [:show]

  # GET /base_goods_descriptions
  def index
    @base_goods_descriptions = BaseGoodsDescription.all.order(:id)
  end

  # GET /base_goods_descriptions/1
  def show
    @goods  = @base_goods_description.goods.order(:color)
    @images = @base_goods_description.images
  end

  # GET /base_goods_descriptions/new
  def new
    @base_goods_description = BaseGoodsDescription.new
  end

  # GET /base_goods_descriptions/1/edit
  def edit
    @images = @base_goods_description.images
  end

  # POST /base_goods_descriptions
  def create
    @base_goods_description = BaseGoodsDescription.new(base_goods_description_params)

    if @base_goods_description.save
      if params[:images]
        #===== The magic is here ;)
        params[:images].each do |image|
          @base_goods_description.images.create(image: image)
        end
      end
      redirect_to catalog_path(@base_goods_description), notice: 'Базовое описание товара создано.'

    else
      render :new
    end
  end

  # PATCH/PUT /base_goods_descriptions/1
  def update
      if @base_goods_description.update(base_goods_description_params)
        if params[:images]
          #===== The magic is here ;)
          params[:images].each do |image|
            @base_goods_description.images.create(image: image)
          end
        end

        redirect_to catalog_path(@base_goods_description), notice: 'Базовое описание товара изменено.'
      else
        render :edit
      end
  end

  # DELETE /base_goods_descriptions/1
  def destroy
    @base_goods_description.destroy
    redirect_to catalog_index_path, notice: 'Базовое описание товара удалено.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_base_goods_description
      @base_goods_description = BaseGoodsDescription.friendly.find(params[:id])
    end

    def setup_cart
      @cart_hash = if cookies.signed[:cart]
        JSON.parse(cookies.signed[:cart])
      else
        Hash.new
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def base_goods_description_params
      params.require(:base_goods_description).permit(:name, :description, :country, :youtube_link, :in_hand, :base, :burning_time, :height, :cost, :diameter)
    end
end
