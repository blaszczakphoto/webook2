require 'rails_helper'
require 'rest-client'

RSpec.describe WebArticles::FetchContent do

  subject { described_class.new }
  let(:api_url) { "https://mercury.postlight.com/parser?url=" }
  let(:article_url) { "https://trackchanges.postlight.com/building-awesome-cms-f034344d8ed" }
  it "fetches articles data from external API" do

  end

  xit "it fetches urls of all images" do; end
end