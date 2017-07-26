class SendToKindleController < ApplicationController
  before_action :require_login
  
  def send_email
    send_to_kindle_operation
    redirect_to(webooks_index_path)
  end

  private

  def send_to_kindle_operation
    SendToKindle::Send.new(kindle_email: current_user.kindle_email, book_id: params[:book_id]).call
  end
end
