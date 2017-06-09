module Ebooks
  class Create
    pattr_initialize :urls, :book_name

    def call
      Book.create(name: book_name)
      urls.each do |url|
        article_data = WebArticles::FetchContent.new(url).call
        WebArticles::Store.new(article_data).call
      end
    end
  end
end