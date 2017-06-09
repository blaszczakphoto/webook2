module Ebooks
  class Generate
    pattr_initialize :book

    # API_URL = "http://webookdisk.com/receive_book.php"
    API_URL = "http://webookdisk.profiart.pl/"
    # API_URL = "http://localhost:4567/"

    def call
      response = RestClient.post(API_URL,{
        ebook_draft: {
          book_id: book.id,
          book_opf: book_opf,
          text: text,
          toc: toc, 
        }
        });
      puts response.body
      response.body
    end

    private

    def book_opf
      ApplicationController.render("ebooks/mobi_draft/book.opf.erb", layout: false, locals: {title: book.name})
    end

    def text
      ApplicationController.render("ebooks/mobi_draft/text.html.erb", layout: false, locals: {web_articles: book.web_articles, title: book.name})
    end

    def toc
      ApplicationController.render("ebooks/mobi_draft/toc.html.erb", layout: false,locals: {web_articles: book.web_articles, title: book.name})
    end
  end
end