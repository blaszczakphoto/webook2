require 'rails_helper'

RSpec.describe WebArticles::ImageDoctor do
  context "url is valid" do
    let(:valid_url) do
      "http://www.seerinteractive.com/wp-content/uploads/2011/11/seer-icon_rocket-300x300.png"
    end
    subject { described_class.new(valid_url).call }

    it "returns the same passed url" do
      expect(subject).to eq(valid_url)
    end
  end

  context "url is weird" do
    let(:weird_url) do
      "http://www.seerinteractive.com/wp-content/uploads/2011/11/seer-icon_rocket-300x300.png%2030" \
      "0w,%20http://www.seerinteractive.com/wp-content/uploads/2011/11/seer-icon_rocket-150x150." \
      "png%20150w,%20http://www.seerinteractive.com/wp-content/uploads/2011/11/seer-icon_rocket-80" \
      "x80.png%2080w,%20http://www.seerinteractive.com/wp-content/uploads/2011/11/seer-icon_rocket" \
      "-60x60.png%2060w,%20http://www.seerinteractive.com/wp-content/uploads/2011/11/seer-icon_roc" \
      "ket.png%20500w"
    end
    subject { described_class.new(weird_url).call }

    it "returns first valid url from the string" do
      expect(subject).to eq(
        "http://www.seerinteractive.com/wp-content/uploads/2011/11/seer-icon_rocket-300x300.png")
    end
  end
end