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
    @wechat_user
  end

  def login
    @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))
    @user.authorization_token = SecureRandom.hex(16)
    @user.save
    @user.update(nickName: user_params["nickName"], city: user_params["city"], avatarUrl: user_params["avatarUrl"])
    render json: {
      userId: @user.id,
      authorizationToken: @user.authorization_token,
      nickName: @user.nickName,
      city: @user.city,
      avatarUrl: @user.avatarUrl,
      email: @user.email,
      phoneNumber: @user.phone_number,
      openId: @user.open_id
      }
  end

  private

  def user_params
    params.require("userInfo").permit("nickName", "city", "avatarUrl")
  end
end
