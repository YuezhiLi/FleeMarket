class Api::V1::MessagesController < Api::V1::BaseController
  def create
    @inbox = Inbox.find_by_user_id(message_params[:user_id])
    @user = @current_user
    @message = Message.create(user_id: @user.id, inbox_id: @inbox.id, content: message_params[:content], item_id: message_params[:item_id])
    render :show
  end

  def conversations
    conversations = []
    messages = @current_user.sent_messages + @current_user.received_messages
    messages.sort_by! { |m| m.created_at }.reverse!
    interlocutors = messages.map { |m| m.user == @current_user ? m.inbox.user : m.user }
    interlocutors.uniq!
    items = messages.map { |m| m.item }
    items.uniq!
    items.each do |item|
      interlocutors.each do |interlocutor|
        @messages = messages.select { |m| m.item == item && m.user == interlocutor } + messages.select { |m| m.item == item && m.inbox.user == interlocutor }
        conversation = { item: item, interlocutor: interlocutor, last_message: @messages.first.content, created_at: @messages.first.created_at.strftime("%A, %d %b %Y %l:%M %p") } unless @messages == []
        conversations << conversation unless conversation.nil?
      end
    end
    @selling_conversations = conversations.select { |c| c[:item].user_id == @current_user.id }
    @buying_conversations = conversations.select { |c| c[:item].user_id != @current_user.id }
  end

  def conversation
    @user = @current_user
    @interlocutor = User.find(params[:user_id])
    @item = Item.find(params[:item_id])
    @messages = @user.sent_messages.select { |m| m.item == @item && m.inbox.user == @interlocutor } + @user.received_messages.select { |m| m.item == @item && m.user == @interlocutor }
    @messages.sort_by! { |m| m.created_at }
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content, :item_id)
  end
end
