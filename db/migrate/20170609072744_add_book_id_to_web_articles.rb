class AddBookIdToWebArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :web_articles, :book_id, :integer
    add_index :web_articles, :book_id
  end
end
