require 'sinatra/base'
require './lib/twitterapi.rb'
require './lib/wordscan.rb'
require 'bundler'
Bundler.require

module GeorgeCarlin
  class App < Sinatra::Base

  get '/' do
	  erb :home
  end

  # From form
  post '/user' do
    params[:screenName]
    @hi = "#{params[:screenName]}"
    @userResults = TwitterAPI.new.checkUser("#{params[:screenName]}")
    erb :user
  end

	get '/user' do
    erb :home
	end

  get '/random' do
      @random = TwitterAPI.new.openSourceWords
      erb :random
  end

  get '/about' do
      erb :bio
  end

  not_found do
    erb :notFound404
  end

  end
end