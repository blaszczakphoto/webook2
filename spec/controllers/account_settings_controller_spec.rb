require 'rails_helper'

RSpec.describe AccountSettingsController, type: :controller do
  let(:user) { create(:user, kindle_email: "john.doe@kindle.com") }
  before do
    sign_in_as(user)
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #update" do
    it "returns http success" do
      params = { params: {kindle_email: "john.doe@kindle.com"} }
      post :update, params
      expect(response).to have_http_status(:success)
    end

    it "updates current_user" do
      params = { params: {kindle_email: "johny@kindle.com"} }
      post :update, params
      expect(user.reload.kindle_email).to eq("johny@kindle.com")
    end
  end
end
