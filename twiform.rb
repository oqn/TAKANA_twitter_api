#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#
# This file is gererated by ruby-glade-create-template 1.1.4.
#

require 'libglade2'
require 'spctwitter.rb'
require 'MeCab'

class TAKANA_mainform
  include GetText

  attr :glade
  
  def initialize(path_or_data, root = nil, domain = nil, localedir = nil, flag = GladeXML::FILE)
    bindtextdomain(domain, localedir, nil, "UTF-8")
    @glade = GladeXML.new(path_or_data, root, domain, localedir, flag) {|handler| method(handler)}
  end  
  
  def on_wMain_destroy(widget)
    p 'bye'
    Gtk.main_quit
  end

  def on_bTweets_clicked(widget)
    begin
      @t.tweet(@glade['tvTweet'].buffer.text)
      @glade['lEtc'].text = "(tweet successful)"+@glade['tvTweet'].buffer.text
      @glade['tvTweet'].buffer.text = ""
    rescue
      @glade['lEtc'].text = "(tweet unsuccessful)"
    end
  end

  def on_bMyTweets_clicked(widget)
    tltxt = @t.timeline
    #p tltxt
    @glade['tvResponce'].buffer.text = ''
    tltxt.each{|tlt|
      @glade['tvResponce'].buffer.text += tlt.text+"\n"
    }
    @glade['lEtc'].text = "(showing timeline)"
    
    #pp @t.user_timeline
    #puts '*'*50
    
    #pp @t.replies
    #puts '*'*50
    puts "on_bMyTweets_clicked() is not implemented yet."
  end

  def on_bLogin_clicked(widget)
    @t = TAKAKI.new
    @glade['lEtc'].text = "(login successful)"
  end

  def on_bReply_clicked(widget)
    puts "on_bReply_clicked() is not implemented yet."
  end
  
end
