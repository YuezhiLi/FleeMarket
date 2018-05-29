class Api::V1::MessagesController < Api::V1::BaseController
  def create
    @inbox = User.find(message_params[:user_id]).inbox
    @user = @current_user
    @message = Message.create(user_id: @user.id, inbox_id: @inbox.id, content: message_params[:content])
    render json: {
      to: @message.inbox.user,
      content: @message.content
    }
  end

  def interlocutors
    @messages = @current_user.sent_messages + @current_user.received_messages
    @messages.sort_by! { |m| m.created_at }.reverse!
    @interlocutors = []
    @messages.each do |m|
      @interlocutors << m.user if m.inbox == @current_user.inbox
      @interlocutors << m.inbox.user if m.user == @current_user
    end
    @interlocutors.uniq!
  end

  def conversation
    @user = @current_user
    @messages = []
    @messages += @user.sent_messages.select{ |m| m.inbox.user_id == params[:user_id].to_i }
    @messages += @user.received_messages.select { |m| m.user_id == params[:user_id].to_i }
    @messages.sort_by! { |m| m.created_at }
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content)
  end
end
