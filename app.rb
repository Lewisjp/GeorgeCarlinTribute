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

  post '/user' do
  end

	get '/user/:userParams' do
    @userResults = TwitterAPI.new.checkUser(:userParams)
    erb :user
	end

  get '/random' do
      @random = TwitterAPI.new.openSourceWords
      erb :random
  end

  get '/about' do

      erb :bio
  end

  end
end