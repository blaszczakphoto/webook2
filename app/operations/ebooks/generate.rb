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
      render_draft("book.opf.erb", {title: book.name})
    end

    def text
      render_draft("text.html.erb",{web_articles: book.web_articles, title: book.name})
    end

    def toc
      ApplicationController.render("ebooks/mobi_draft/toc.html.erb", layout: false,locals: {web_articles: book.web_articles, title: book.name})
    end

    def render_draft(draft_file_name, locals)
      ApplicationController.render("ebooks/mobi_draft/#{draft_file_name}", layout: false, locals: locals)
    end
  end
end