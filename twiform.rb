#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#
# This file is gererated by ruby-glade-create-template 1.1.4.
#
require 'libglade2'
require 'spctwitter.rb'
#require 'MeCab'

class TAKANA_mainform
  include GetText
  
  attr :glade
    
  
  
  def initialize(path_or_data, root = nil, domain = nil, localedir = nil, flag = GladeXML::FILE)
    bindtextdomain(domain, localedir, nil, "UTF-8")
    @glade = GladeXML.new(path_or_data, root, domain, localedir, flag) {|handler| method(handler)}
  end
  
  #*Events ************************************************************************
  
  def on_bLogin_clicked(widget)
    @glade["wMain"].show_all
    @glade["wDrawArea"].show_all
    @glade["wLogin"].destroy    

    @t=TAKAKI.new
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
    out_Disp( @t.utimeline, "timelines")
  end
  
  def on_bShowTimeLine_clicked(widget)
    out_Disp( @t.ftimeline, "friend's timelines")
  end
  
  def on_bReply_clicked(widget)
    out_Disp( @t.replies, "replies")
  end

  def on_bMecab_clicked(widget)
    p "mecab"
  end

  def on_bSave_clicked(widget)
  end
  
  def on_wMain_destroy(widget)
    Gtk.main_quit
  end

  def on_wLogin_destroy(widget)
    
  end


#*Function**********************************************************

#*Method****************************************************************
  def out_Disp( otext, msg)
    begin
      @glade['tvResponce'].buffer.text = ''
      otext.each{|tlt|
        @glade['tvResponce'].buffer.text += tlt.text+"\n"
      }
      @glade['lEtc'].text = "( showing your "+msg+" )"
    rescue
      @glade['lEtc'].text = "( unsuccess "+msg+" )"
    end
  end
end


# Main program
if __FILE__ == $0
  # Set values as your own application. 
  PROG_PATH = "glade/twiform.glade"
  PROG_NAME = "YOUR_APPLICATION_NAME"
  TwiformGlade.new(PROG_PATH, nil, PROG_NAME)
  #o.glade["wLogin"].show_all
  Gtk.main
end
