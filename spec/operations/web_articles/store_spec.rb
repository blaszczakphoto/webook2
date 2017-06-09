require 'rails_helper'

RSpec.describe WebArticles::Store do
  let(:article_data) do
    {
      "title" => "Sample title",
      "content" => "Sample content",
      "author" => "John Kowalski",
      "date_published" => "11-05-1991",
      "url" => "www.wp.pl",
      "word_count" => "566",
      "image_urls" => [
        "http://www.image.com/1.jpg", 
        "http://www.image.com/2.jpg", 
        "http://www.image.com/3.jpg",
      ],
    }
  end
  let(:book) { create(:book)}
  subject { described_class.new(article_data, book).call }
  it "stores article content" do
    expect(subject.content).to eq("Sample content")
  end

  it "stores article images" do
    expect(subject.image_urls).to eq("http://www.image.com/1.jpg;;;http://www.image.com/2.jpg;;;http://www.image.com/3.jpg")
  end

  it "stores title" do
    expect(subject.title).to  eq("Sample title")
  end

  it "stores date_published" do
    expect(subject.date_published).to  eq("11-05-1991",)
  end

  it "stores url" do
    expect(subject.url).to  eq("www.wp.pl",)
  end

  it "stores word_count" do
    expect(subject.word_count).to  eq("566",)
  end

  it "associates web_article with a book" do
    expect(subject.book_id).to eq(book.id)
  end
end