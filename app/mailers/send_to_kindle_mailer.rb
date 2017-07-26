class SendToKindleMailer < ApplicationMailer
  def create(kindle_email:, book_binary_content:, book_filename_with_ext:)
    attachments[book_filename_with_ext] = book_binary_content
    mail(to: kindle_email, subject: "Ebook file in the attachment!") do |format|
      format.text { render plain: "Ebook file in the attachment" }
    end
  end
end
