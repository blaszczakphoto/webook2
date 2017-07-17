require 'rails_helper'

RSpec.describe MercuryPostlight::ParseWebpage do
  subject { described_class.new(url).call }
  let(:url) { "https://trackchanges.postlight.com/building-awesome-cms-f034344d8ed" }
  
  it "fetches articles title from external API" do
    expect(subject["title"]).to eq("Building Awesome CMS")
  end
  
end