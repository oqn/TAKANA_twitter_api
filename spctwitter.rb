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
    
#    p consumer_token_key
#    p consumer_secret

    # oauth = Twitter::OAuth.new(consumer_token_key, consumer_secret)
    # oauth.authorize_from_access(access_token_key, access_secret)
    
    Twitter.configure do |config|
      config.consumer_key = consumer_token_key
      config.consumer_secret = consumer_secret
      config.oauth_token = access_token_key
      config.oauth_token_secret = access_secret
    end
    
    @client = Twitter

  end

  ###################################################
  ### put 　　                                    ###
  ###################################################
  def tweet(text)
    @client.update(text)
  end


  ###################################################
  ### get 　　                                    ###
  ###################################################
  def ftimeline
    tl2string @client.friends_timeline({'count' => '20'})
  end

  def replies
    tl2string @client.mentions
  end

  def utimeline
    tl2string @client.user_timeline
  end


  private
  def tl2string(timeLines)
    ret = []
    timeLines.each do |tl|
      ret << "@" + tl.user.screen_name + " : "+ tl.text
    end
    return ret
  end


end


