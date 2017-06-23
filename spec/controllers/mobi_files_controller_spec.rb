require 'rails_helper'

RSpec.describe MobiFilesController, type: :controller do
  describe "GET #download" do
    let!(:albania_book) { FactoryGirl.create(:book) }
    let(:params) { {params: {book_id: albania_book.id}} }
    let(:mobi_url) { "http://www.dropbox.com/albania.mobi" }

    it "calls Ebooks::Generate with book as an attribute" do
      ebooks_generate  = double("Ebooks::Generate").as_null_object
      allow(ebooks_generate).to receive(:call) { mobi_url }
      
      expect(Ebooks::Generate).to receive(:new).with(albania_book) { ebooks_generate }

      get :download, params
    end

    it "redirects to download url" do
      ebooks_generate  = double("Ebooks::Generate").as_null_object
      allow(ebooks_generate).to receive(:call) { mobi_url }
      allow(Ebooks::Generate).to receive(:new).with(albania_book) { ebooks_generate }

      get :download, params

      expect(response).to redirect_to("http://www.dropbox.com/albania.mobi")
    end
  end
end
