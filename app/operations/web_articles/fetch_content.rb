require 'rest-client'

module WebArticles
  class FetchContent
    pattr_initialize :article_url

    def call
      api_url = "https://mercury.postlight.com/parser"
      api_key = ENV.fetch("MERCURY_WEB_PARSER_API_KEY")
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
      article_data.merge({"image_urls" => urls})
    end
  end
end