module Ebooks
  class Create
    pattr_initialize :urls, :book_name

    def call
      book = Book.create(name: book_name)
      urls.each do |url|
        article_data = WebArticles::FetchContent.new(url).call
        WebArticles::Store.new(article_data, book).call
      end
    end
  end
end