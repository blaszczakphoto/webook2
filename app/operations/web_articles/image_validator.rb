module WebArticles
  class ImageValidator
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
      url = URI.parse(tested_url)
      req = Net::HTTP.new(url.host, url.port)
      res = req.request_head(url.path)
      res.code.to_i == 200
    end
  end
end