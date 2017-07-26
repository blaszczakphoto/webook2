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
      book_mobi_binary_file = ""
      open(mobi_file_url) { |file| book_mobi_binary_file = file.read }
      SendToKindleMailer.mobi_file(
        kindle_email: kindle_email, 
        book_mobi_binary_file: book_mobi_binary_file
      ).deliver_now
    end

    private
  end
end