class SendToKindleMailer < ApplicationMailer
  def mobi_file
    attachments["book.mobi"] = File.open("/home/mariusz/Projects/Ruby/webook/public/books/AXVPBBAO/Dupa_blada.mobi").read
    mail(to: "mariusz.blaszczak@gmail.com", subject: "This is test!") do |format|
      format.text { render plain: "Mobile file in the attachment" }
    end
  end
end
