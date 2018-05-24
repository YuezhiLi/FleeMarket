json.user do
    json.id @user.id
    json.nickName @user.nickName
    json.email @user.email
    json.avatarUrl @user.avatarUrl
    json.phoneNumber @user.phoneNumber
    json.wechat_id @user.wechat_id
    json.QRCode @user.qr_code
end
