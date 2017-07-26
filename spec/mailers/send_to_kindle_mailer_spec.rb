require "rails_helper"

RSpec.describe SendToKindleMailer, type: :mailer do
  let(:book_binary_content) { File.open("#{Rails.root}/spec/support/sample.mobi").read }
  subject do
    described_class.mobi_file(
      kindle_email:  "mariusz.blaszczak@gmail.com", 
      book_binary_content: book_binary_content,
      book_filename_with_ext: "samplebook123.mobi"
    )
  end
  it "attach valid recipient" do
    expect(subject.to).to eq(["mariusz.blaszczak@gmail.com"])
  end

  it "attach valid sender" do
    expect(subject.from).to eq(["webook075@gmail.com"])
  end

  it "sends email" do
    expect { subject.deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it "attach mobi file" do
    expect(subject.attachments.first.filename).to eq("samplebook123.mobi")
    expect(subject.attachments.first.body.raw_source).to eq(book_binary_content)
  end
end
