require 'rails_helper'

RSpec.describe WebArticles::ImageValidator do
  subject { described_class.new(url).call }

  context "url is weird" do
    let(:url) do
      "http://www.seerinteractive.com/wp-content/uploads/2011/11/seer-icon_rocket-300x300.png%20300w,%20http://www.seerinteractive.com/wp-content/uploads/2011/11/seer-icon_rocket-150x150.png%20150w,%20http://www.seerinteractive.com/wp-content/uploads/2011/11/seer-icon_rocket-80x80.png%2080w,%20http://www.seerinteractive.com/wp-content/uploads/2011/11/seer-icon_rocket-60x60.png%2060w,%20http://www.seerinteractive.com/wp-content/uploads/2011/11/seer-icon_rocket.png%20500w"
    end

    it "returns valid url" do
      expect(subject).to eq("http://www.seerinteractive.com/wp-content/uploads/2011/11/seer-icon_rocket-300x300.png")
    end
  end
end