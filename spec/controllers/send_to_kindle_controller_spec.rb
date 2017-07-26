require 'rails_helper'

RSpec.describe SendToKindleController, type: :controller do
  let(:user) { create(:user, kindle_email: "john.doe@kindle.com") }
  before { sign_in_as(user) }

  describe "GET #send" do
    let(:params) do 
      { params: { book_id: 2 } } 
    end

    subject { get :send_email, params }

    it "initialize operation with valid params" do
      send_operation_object = double("SendToKindle::Send").as_null_object
      expect(SendToKindle::Send)
        .to receive(:new)
        .with(kindle_email: "john.doe@kindle.com", book_id: "2") { send_operation_object }
      get :send_email, params
    end

    it "redirect to webooks index" do
      send_operation_object = double("SendToKindle::Send").as_null_object
      allow_any_instance_of(SendToKindle::Send).to receive(:call)
      expect(subject).to redirect_to(webooks_index_path)
    end
  end
end
