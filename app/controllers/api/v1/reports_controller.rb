class Api::V1::ReportsController < Api::V1::BaseController
  def create
    @report = Report.new(user_id: @current_user.id, item_id: report_params[:item_id], cause: report_params[:cause])
    @report.save
    Message.create(user_id: 11, inbox_id: @report.item.user.inbox.id, item_id: @report.item.id, content: "Your item #{@report.item.title} has been reported because #{@report.cause} and may be taken down. You can make corresponding changes to the item or appeal to the admin here.")
  end

  private

  def report_params
    params.require(:report).permit(:item_id, :cause)
  end
end
