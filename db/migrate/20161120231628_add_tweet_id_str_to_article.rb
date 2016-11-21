class AddTweetIdStrToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :tweet_id_str, :string, limit: 255
  end
end
