class SendToKindleMailer < ApplicationMailer
  def mobi_file(kindle_email:, book_mobi_binary_file:)
    attachments["book.mobi"] = book_mobi_binary_file
    
    mail(to: kindle_email, subject: "This is test!") do |format|
      format.text { render plain: "Mobile file in the attachment" }
    end
  end
end
