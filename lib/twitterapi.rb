require 'twitter'
require './lib/wordscan.rb'

class TwitterAPI

  #The Search API is not complete index of all Tweets, but instead an index of recent Tweets. At the moment that index includes between 6-9 days of Tweets.

  # https://dev.twitter.com/rest/public/search

  def initialize(wordScanParam = WordScan.new)

    @wordScan = wordScanParam

# Key and Secret have been regenerated
# Token and Token secret have been regenerated 

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ""
      config.consumer_secret = ""
      config.access_token = "1692828073-kGSVw9UOREMSEINBugqqnKIzyobszPShiHk8LZi"
      config.access_token_secret = "iXUuKIAhQVUucS93uQyC13MPqjnGvUuLq3E0Jyt1Iqrcb"
    end
  end

  def checkUser(screenName = "carlinquotes")
    checkUser = @client.search("from:#{screenName} #{@wordScan.orConditional}", result_type: "recent").collect do |tweet|
        "#{tweet.user.screen_name}: #{tweet.text}"
    end

    if checkUser.empty?
      checkUser << "#{screenName}: User didn't use any of the phrases."
    end

    return checkUser
  end

  def openSourceWords
    notTVwords = @client.search("#{@wordScan.orConditional}", result_type: "recent").take(7).collect do |tweet|
        "#{tweet.user.screen_name}: #{tweet.text}"
    end

    return notTVwords
  end
end