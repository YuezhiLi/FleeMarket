class Api::V1::LoginController < Api::V1::BaseController
  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze
  def wechat_params
   {
    appid: ENV["appid"],
    secret: ENV["secret"],
    js_code: params[:code],
    grant_type: "authorization_code" }
  end

  def wechat_user
    @wechat_response ||= RestClient.post( URL, wechat_params )
    @wechat_user ||= JSON.parse(@wechat_response.body)
    p @wechat_user
  end

  def login
    @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))
    @user.update(params[:userInfo])
    render json: {
      userId: @user.id
      }
  end
end
