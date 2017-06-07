require 'rails_helper'
require 'rest-client'

RSpec.describe Ebooks::Generate do
  include ActionController

  # let(:webook_disk_api_url) { "http://webookdisk.com/receive_book.php" }
  let(:webook_disk_api_url) { "http://webookdisk.profiart.pl/" }
  # let(:webook_disk_api_url) { "http://localhost:4567/" }
  it "sends POST request to webook_disk API" do
    book_opf = ApplicationController.render("ebooks/mobi_draft/book.opf", layout: false)
    text = ApplicationController.render("ebooks/mobi_draft/text.html", layout: false)
    toc = ApplicationController.render("ebooks/mobi_draft/toc.html", layout: false)
    response = RestClient.post(webook_disk_api_url,{
      ebook_draft: {
        book_id: 1234,
        book_opf: book_opf,
        text: text,
        toc: toc, 
      }
    });
    puts response.body
    expect(response.body).to include(".mobi")
  end
end