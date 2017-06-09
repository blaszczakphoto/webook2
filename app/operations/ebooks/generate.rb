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
          book_opf: render_book_opf_draft,
          text: render_text_draft,
          toc: render_toc_draft, 
        }
        });
      puts response.body
      response.body
    end

    private

    def render_book_opf_draft
      render_draft("book.opf.erb", draft_params)
    end

    def render_text_draft
      render_draft("text.html.erb", draft_params)
    end

    def render_toc_draft
      render_draft("toc.html.erb", draft_params)
    end

    def draft_params
      {
        web_articles: book.web_articles, 
        title: book.name
      }
    end

    def render_draft(draft_file_name, locals)
      ApplicationController.render("ebooks/mobi_draft/#{draft_file_name}", layout: false, locals: locals)
    end
  end
end