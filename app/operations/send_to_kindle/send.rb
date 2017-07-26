require 'open-uri'
module SendToKindle
  class Send
    attr_reader :kindle_email, :book_id
    
    def initialize(kindle_email:, book_id:)
      @kindle_email = kindle_email
      @book_id = book_id
    end

    def call
      book = Book.find(book_id)
      mobi_file_url = Ebooks::Generate.new(book).call
      book_binary_content = ""
      open(mobi_file_url) { |file| book_binary_content = file.read }
      SendToKindleMailer.mobi_file(
        kindle_email: kindle_email, 
        book_binary_content: book_binary_content,
        book_filename_with_ext: book.name
      ).deliver_now
    end

    private
  end
end