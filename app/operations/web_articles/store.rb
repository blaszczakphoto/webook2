module WebArticles
  class Store
    pattr_initialize :article_data

    def call
      web_article = WebArticle.new
      web_article.content = article_data.fetch("content")
      web_article.image_urls = article_data.fetch("image_urls").join(";;;")
      web_article.save
      web_article
    end
  end
end