class WebooksController < ApplicationController
  before_action :require_login
  
  def index
    @webooks = Book.all.order(updated_at: :desc)
  end

  def new
    @webook_props = { action: webooks_create_path, form_authenticity_token: form_authenticity_token }
  end

  def create
    book_name = params[:book_name]
    urls = params[:urls]
    Ebooks::Create.new(urls, book_name).call
    redirect_to webooks_index_path
  end

  def edit
  end

  def delete
  end
end
