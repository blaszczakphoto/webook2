class SendToKindleController < ApplicationController
  before_action :require_login
  
  def send_email
    SendToKindle::Send.new(kindle_email: current_user.kindle_email, book_id: params[:book_id]).call
    redirect_to webooks_index_path
  end
end
