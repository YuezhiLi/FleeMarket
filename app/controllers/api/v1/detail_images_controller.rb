class Api::V1::DetailImagesController < Api::V1::BaseController
  def create
    @detail_images = DetailImage.new(detail_images_params)
  end

  private
  def detail_images_params
    params.require(:image).permit(:url)
  end
end
