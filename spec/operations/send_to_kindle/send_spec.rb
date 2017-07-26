require 'rails_helper'

RSpec.describe SendToKindle::Send do
  let!(:book) do
    created_book = create(:book, name: "Krzyżacy")
    create(:web_article, book: created_book)
    created_book
  end
  subject { described_class.new(kindle_email: "mariusz.blaszczak@gmail.com", book_id: book.id) }

  it "sends email" do
    expect { subject.call }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end