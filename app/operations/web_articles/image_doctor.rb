require "rest-client"

module WebArticles
  class ImageDoctor
    pattr_initialize :base_url

    def call
      return base_url if url_exists?(base_url)
      images_urls = parse_to_array(base_url)
      images_urls.each do |url|
        return url if url_exists?(url)
      end
      return false
    end

    private

    def parse_to_array(url)
      url.scan(/(https?:\/\/.*?\.(?:jpg|png|gif))/i).flatten
    end

    def url_exists?(tested_url)
      RestClient.head(tested_url).code == 200
    rescue RestClient::Exception => e
      return false
    end
  end
end