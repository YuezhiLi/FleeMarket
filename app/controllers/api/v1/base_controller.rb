class Api::V1::BaseController < ActionController::Base

  rescue_from StandardError,                with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  before_action :authenticate_with_token
  before_action :check_item_status

  private

  def authenticate_with_token
    token = request.headers['X-fleaMarket-Token']
    @current_user = User.find_by_authorization_token(token)
    unless @current_user
      raise ActiveRecord::RecordNotFound, 'bad X-fleaMarket-Token'
    end
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def internal_server_error(exception)
    if Rails.env.development?
      response = { type: exception.class.to_s, error: exception.message }
    else
      response = { error: "Internal Server Error" }
    end
    render json: response, status: :internal_server_error
  end

  def check_item_status
    items = Item.all
    items.each do |i|
      lapse = Time.now - i.updated_at
      i.expired = true if lapse / 86400 >= 30
      i.save
    end
  end
end
