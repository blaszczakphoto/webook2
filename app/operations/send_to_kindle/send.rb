require 'open-uri'
module SendToKindle
  class Send
    attr_reader :kindle_email, :book_id
    
    def initialize(kindle_email:, book_id:)
      @kindle_email = kindle_email
      @book_id = book_id
    end

    def call
      send_to_kindle_email
    end

    private

    def send_to_kindle_email
      SendToKindleMailer.create(
        kindle_email: kindle_email, 
        book_binary_content: book_binary_content,
        book_filename_with_ext: book_filename_with_ext
      ).deliver_now
    end

    def book_binary_content
      open(mobi_file_url) { |file| file.read }
    end

    def mobi_file_url
      Ebooks::Generate.new(book).call
    end

    def book
      @book ||= Book.find(book_id)
    end

    def book_filename_with_ext
      "#{book.name}.mobi"
    end
  end
end