require 'rails_helper'

RSpec.describe SendToKindleController, type: :controller do
  let(:user) { create(:user, kindle_email: "john.doe@kindle.com") }
  before { sign_in_as(user) }

  describe "GET #send" do
    let(:params) do 
      { params: { book_id: 2 } } 
    end
    it "initialize operation with valid params" do
      get :send_email, params
      send_operation_object = double("SendToKindle::Send")
      expect(SendToKindle::Send).to receive(:new).with(kindle_email: "john.doe@kindle.com", book_id: "2")
    end
  end
end
