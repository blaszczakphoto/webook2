module Ebooks
  class Create
    pattr_initialize :urls, :book_name

    def call
      Book.create(name: book_name)
      articles_data = urls.map do |url|
        WebArticles::FetchContent.new(url).call
      end
    end
  end
end