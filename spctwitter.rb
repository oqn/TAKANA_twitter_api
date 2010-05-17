#!/usr/bin/ruby
# -*- coding: utf-8 -*-
require 'rubygems'
require 'twitter'
require 'MeCab'

class TAKAKI
  def initialize
    consumer_token_key="FtsHUY8yaSiMJpWOfTzuUw"
    consumer_secret="En0JVvDNx0WI1C2zp56gGH0ZcuNNOLUxRmLGg1pC4"
    
    access_token_key="42127145-DBLQ0FYJB40JMajXDAMVacUy7PNmCloeZTZqG472M"
    access_secret="msOgzeK2R3E2ClZ3DZIPrFQkzIjmg3V0ycHtN7Jzhg"
    
    oauth = Twitter::OAuth.new(consumer_token_key, consumer_secret)
    oauth.authorize_from_access(access_token_key, access_secret)
    @client = Twitter::Base.new(oauth)
  end

  def tweet(text)
    @client.update(text)
  end
 
  def timeline
    @client.friends_timeline
  end
end
