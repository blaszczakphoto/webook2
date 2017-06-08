class CreateWebArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :web_articles do |t|
      t.text :content
      t.string :title
      t.string :url
      t.string :image_urls
      t.string :author
      t.string :word_count
      t.string :date_published

      t.timestamps
    end
  end
end
