class SendToKindleMailer < ApplicationMailer
  def mobi_file(kindle_email:, book_binary_content:, book_filename_with_ext:)
    attachments[book_filename_with_ext] = book_binary_content
    mail(to: kindle_email, subject: "This is test!") do |format|
      format.text { render plain: "Mobile file in the attachment" }
    end
  end
end
