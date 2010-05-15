# -*- coding: utf-8 -*-

#!/usr/bin/ruby
# -*- coding: utf-8 -*-
require 'rubygems'
require 'twitter'
require 'MeCab'

def tweet(text)

  consumer_token_key="yvGpZMJqyYiypgjAFCN4w"
  consumer_secret="WwfbiQzD5VZxqTO51Nq5UFA5JjcFPQzlvrq2Lrrs"
  
  access_token_key="42127145-DBLQ0FYJB40JMajXDAMVacUy7PNmCloeZTZqG472M"
  access_secret="msOgzeK2R3E2ClZ3DZIPrFQkzIjmg3V0ycHtN7Jzhg"

  oauth = Twitter::OAuth.new(consumer_token_key, consumer_secret)
  oauth.authorize_from_access(access_token_key, access_secret)

  client = Twitter::Base.new(oauth)
  client.update(text)
#  puts ("**recent tweets**")
#  sentence = client.friends_timeline[0].text
#  c = MeCab::Tagger.new(ARGV.join(" ")) 
#  puts c.parse(sentence)

#  puts client.friends_timeline[0].user.name

end
