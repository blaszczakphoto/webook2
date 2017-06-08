module WebArticles
  class Store
    pattr_initialize :article_data

    def call
      web_article = WebArticle.new
      web_article.content = article_data.fetch("content")
      web_article.title = article_data.fetch("title")
      web_article.url = article_data.fetch("url")
      web_article.url = article_data.fetch("url")
      web_article.word_count = article_data.fetch("word_count")
      web_article.date_published = article_data.fetch("date_published")
      web_article.image_urls = article_data.fetch("image_urls").join(";;;")
      web_article.save
      web_article
    end
  end
end