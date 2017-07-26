require 'rails_helper'

RSpec.describe Ebooks::Create, :vcr do
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

  it "fetches content for each url" do
    fetch_content = double("FetchContent").as_null_object
    expect(WebArticles::FetchContent).to receive(:new).once.with(urls.first) { fetch_content }
    expect(WebArticles::FetchContent).to receive(:new).once.with(urls.second) { fetch_content }
    expect(WebArticles::FetchContent).to receive(:new).once.with(urls.third) { fetch_content }
    subject.call
  end

  it "stores content for all urls" do
    expect { subject.call }.to  change { WebArticle.count }.by(3)
  end

  it "associates web_articles with Book" do
    subject.call
    expect(Book.last.web_articles.count).to be(3)
  end
end