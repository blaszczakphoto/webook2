require 'rails_helper'
require 'rest-client'

RSpec.describe WebArticles::FetchContent do
  subject { described_class.new(article_url).call }
  let(:article_url) { "https://trackchanges.postlight.com/building-awesome-cms-f034344d8ed" }
    it "fetches articles data from external API" do
    expect(subject["title"]).to eq("Building Awesome CMS")
  end

  it "it fetches urls of all images" do
    expect(subject["image_urls"].first).to eq("https://cdn-images-1.medium.com/max/1600/1*zo51eqdjJ_XSU0D8Vm8P9A.png")
  end

  it "replaces img src attributes with file system paths" do
    content = subject.fetch('content')
    expect(content).to_not include("src=\"https://cdn-images-1.medium.com/max/1600/1*zo51eqdjJ_XSU0D8Vm8P9A.png\"")
    expect(content).to include("src=\"images/1*zo51eqdjJ_XSU0D8Vm8P9A.png\"")
  end
end