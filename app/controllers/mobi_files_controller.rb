class MobiFilesController < ApplicationController
  def download
    book = Book.find(params[:book_id])
    mobi_url = Ebooks::Generate.new(book).call
    redirect_to(mobi_url)
  end
end
