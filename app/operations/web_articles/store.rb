module WebArticles
  class Store
    pattr_initialize :article_data, :book

    def call
      web_article = WebArticle.new
      web_article.assign_attributes(whitelisted_attributes  )
      web_article.image_urls = images_urls_array_to_single_string
      web_article.book_id = book.id
      web_article.save
      web_article
    end

    private

    def whitelisted_attributes
      ActionController::Parameters.new(article_data).permit(:content, :title, :url, :word_count, :date_published)
    end

    def images_urls_array_to_single_string
      article_data.fetch("image_urls").join(";;;")
    end
  end
end