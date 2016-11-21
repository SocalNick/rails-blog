namespace :blog do
  desc "Update the number of retweets for all articles with a Tweet ID"
  task update_retweets: :environment do
    puts 'Updating retweets for all blog articles...'

    Article.all.each do |article|
      next if article.tweet_id_str.blank?

      tweet = client.status(article.tweet_id_str)
      article.retweet_count = tweet.retweet_count
      article.save!

      puts "Set retweet count to #{article.retweet_count} for article: [#{article.id}] #{article.title}"
    end
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["twitter_consumer_key"]
        config.consumer_secret     = ENV["twitter_consumer_secret"]
        config.access_token        = ENV["twitter_access_token"]
        config.access_token_secret = ENV["twitter_access_token_secret"]
    end
  end

end
