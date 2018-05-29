class Api::V1::DetailImagesController < Api::V1::BaseController
  def create
    @detail_image = DetailImage.new(detail_image_params)
    @detail_image.save
    render json: {
      id: @detail_image.id,
      item_id: @detail_image.item_id,
      url: @detail_image.url
    }
  end

  def show
    @detail_image = DetailImage.find(params[:id])
  end

  def destroy
    @detail_image = DetailImage.find(params[:id])
    @detail_image.destroy
  end

  private
  def detail_image_params
    params.require(:image).permit(:url, :item_id)
  end
end
