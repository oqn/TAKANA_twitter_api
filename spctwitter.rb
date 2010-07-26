#!/usr/bin/ruby
# -*- coding: utf-8 -*-
#TAKAKI-twitter class-


require 'rubygems'
require 'twitter'
require 'MeCab'
require 'stringio'

class TAKAKI
  def initialize
    f= open( "logindata.dat")
    
    consumer_token_key = f.readline.chomp
    consumer_secret = f.readline.chomp    
    access_token_key = f.readline.chomp
    access_secret = f.readline.chomp
    
    oauth = Twitter::OAuth.new(consumer_token_key, consumer_secret)
    oauth.authorize_from_access(access_token_key, access_secret)

    @client = Twitter::Base.new(oauth)
  end

  def tweet(text)
    @client.update(text)
  end
  
  def ftimeline
    @client.friends_timeline
  end

  def replies
    @client.mentions
  end

  def utimeline
    @client.user_timeline
  end
end
