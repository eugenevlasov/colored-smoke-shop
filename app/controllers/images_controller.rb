class ImagesController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    Image.find(params[:id]).destroy

    head :no_content
  end
end
