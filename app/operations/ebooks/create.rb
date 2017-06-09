module Ebooks
  class Create
    pattr_initialize :urls, :book_name

    def call
      Book.create(name: book_name)
    end
  end
end