class ChangeImageUrlsInWebArticles < ActiveRecord::Migration[5.1]
  def change
    change_column :web_articles, :image_urls, :text
  end
end
