require 'rails_helper'

RSpec.describe WebArticles::Store do
  let(:article_data) do
    {
      "title" => "Sample title",
      "content" => "Sample content",
      "author" => "John Kowalski",
      "date_published" => "John Kowalski",
      "url" => "John Kowalski",
      "word_count" => "John Kowalski",
      "image_urls" => [
        "http://www.image.com/1.jpg", 
        "http://www.image.com/2.jpg", 
        "http://www.image.com/3.jpg",
      ],
    }
  end
  let(:book) { create(:book)}
  subject { described_class.new(article_data).call }
  it "stores article content" do
    expect(subject.content).to eq("Sample content")
  end
end