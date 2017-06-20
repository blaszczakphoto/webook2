module Ebooks
  class Generate
    pattr_initialize :book

    API_URL = "http://webookdisk.profiart.pl/"
    # API_URL = "http://localhost:4567/"

    def call
      response = send_request_to_webook_disk
      puts response.body
      response.body
    end

    private

    def send_request_to_webook_disk
      RestClient.post(API_URL, request_params)
    end

    def request_params
      {
        ebook_draft: {
          book_id: book.id,
          book_opf: render_book_opf_draft,
          text: render_text_draft,
          toc: render_toc_draft, 
          image_urls: book.web_articles.map { |a| a.image_urls.split(";;;") }.flatten
        }
      }
    end

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
      ApplicationController.render(
        "ebooks/mobi_draft/#{draft_file_name}", 
        layout: false, 
        locals: locals
      )
    end
  end
end