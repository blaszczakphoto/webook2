require "rails_helper"

RSpec.describe SendToKindleMailer, type: :mailer do
  let(:kindle_email) { "mariusz.blaszczak@gmail.com" }
  let(:book_mobi_binary_file) { File.open("#{Rails.root}/spec/support/sample.mobi").read }
  subject do
    described_class.mobi_file(
      kindle_email: kindle_email, 
      book_mobi_binary_file: book_mobi_binary_file
    )
  end
  it "attach valid recipient" do
    expect(subject.to).to eq(["mariusz.blaszczak@gmail.com"])
  end
end
