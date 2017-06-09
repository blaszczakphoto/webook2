require 'rails_helper'

RSpec.describe Ebooks::Generate do
  let(:article1) do
    create(:web_article, title: "Sample title", content: "<p>content</p>")
  end
  let(:article2) do
    create(:web_article, title: "Another article", content: "<p>another content</p>")
  end

  subject { described_class.new.call }

  it "sends POST request to webook_disk API" do
    expect(subject).to include(".mobi")
  end
end