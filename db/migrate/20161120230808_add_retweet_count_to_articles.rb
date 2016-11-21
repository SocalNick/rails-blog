class AddRetweetCountToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :retweet_count, :integer, null: false, default: 0
  end
end
