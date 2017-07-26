require 'rails_helper'

RSpec.describe SendToKindle::Send, :vcr do
  let!(:book) do
    created_book = create(:book, name: "Krzyżacy")
    create(:web_article, book: created_book)
    created_book
  end
  subject { described_class.new(kindle_email: "mariusz.blaszczak@gmail.com", book_id: book.id) }

  it "sends one email" do
    expect { subject.call }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it "sends email to kindle_email" do
    subject.call
    sent_email = ActionMailer::Base.deliveries.last
    expect(sent_email.to).to eq(["mariusz.blaszczak@gmail.com"])
  end

  it "sends email to with filename" do
    subject.call
    sent_email = ActionMailer::Base.deliveries.last
    expect(sent_email.attachments.first.filename).to eq("Krzyżacy.mobi")
  end
end