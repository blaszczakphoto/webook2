class SendToKindleController < ApplicationController
  before_action :require_login
  
  def send_email
    redirect_to webooks_index_path
  end
end
