require 'rails_helper'

RSpec.describe Ebooks::Create do
  let(:urls) do
    [
      "https://www.justinweiss.com/articles/writing-a-one-time-script-in-rails/",
      "http://jakoszczedzacpieniadze.pl/edukacja-finansowa-jak-uczyc-dzieci",
      "https://facebook.github.io/react/blog/2017/05/18/whats-new-in-create-react-app.html",
    ]
  end
  let(:book_name) { "Sample title" }

  subject { described_class.new(urls, book_name) }

  it "creates a new ebook" do
    expect { subject.call }.to change{Book.count}.by(1)
  end

  it "creates a new book with the title passed as argument" do
    subject.call
    expect(Book.last.name).to eq("Sample title")
  end
end