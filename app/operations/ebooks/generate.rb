module Ebooks
  class Generate
    # API_URL = "http://webookdisk.com/receive_book.php"
    API_URL = "http://webookdisk.profiart.pl/"
    # API_URL = "http://localhost:4567/"

    def call
      book_opf = ApplicationController.render("ebooks/mobi_draft/book.opf", layout: false)
      text = ApplicationController.render("ebooks/mobi_draft/text.html", layout: false)
      toc = ApplicationController.render("ebooks/mobi_draft/toc.html", layout: false)
      response = RestClient.post(API_URL,{
        ebook_draft: {
          book_id: 1234,
          book_opf: book_opf,
          text: text,
          toc: toc, 
        }
        });
      response.body
    end
  end
end