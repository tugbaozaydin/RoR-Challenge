class ArticlesCategories < ActiveRecord::Migration[5.1]
  def change
  	create_join_table :articles, :categories do |t|
      t.belongs_to :article_id
      t.belongs_to :category_id
  end
  end
end
