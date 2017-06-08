require 'rails_helper'
require 'rest-client'

RSpec.describe WebArticles::FetchContent do

  subject { described_class.new(article_url) }

  let(:article_url) { "https://trackchanges.postlight.com/building-awesome-cms-f034344d8ed" }
  let(:api_url) { "https://mercury.postlight.com/parser" }
  let(:api_key) { ENV.fetch("MERCURY_WEB_PARSER_API_KEY") }
  it "fetches articles data from external API" do
    article_data = subject.call
    expect(article_data["title"]).to eq("Building Awesome CMS")
  end

  it "it fetches urls of all images" do
    response = RestClient::Request.execute(
      method: :get, 
      url: api_url, 
      headers: {
        "Content-Type" => "application/json", 
        "x-api-key" => api_key,
        "params" => {
          "url" => article_url
        },
      }
    )
    article_data = JSON.parse(response)
    doc = Nokogiri::HTML(article_data["content"])
    urls = doc.css("img").map { |img_tag| img_tag.attributes["src"].value }
    expect(urls.first).to eq("https://cdn-images-1.medium.com/max/800/1*zo51eqdjJ_XSU0D8Vm8P9A.png")
  end
end