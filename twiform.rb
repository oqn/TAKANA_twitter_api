#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#
# This file is gererated by ruby-glade-create-template 1.1.4.
#
require 'libglade2'
require 'spctwitter.rb'
require 'MeCab'

class TwiformGlade
  include GetText

  attr :glade
  
  def initialize(path_or_data, root = nil, domain = nil, localedir = nil, flag = GladeXML::FILE)
    bindtextdomain(domain, localedir, nil, "UTF-8")
    @glade = GladeXML.new(path_or_data, root, domain, localedir, flag) {|handler| method(handler)}
  end
  
  def on_wMain_destroy(widget)
    gtk_main_quit()
  end
  


  def on_bLogin_clicked(widget)
    tweet(@glade['tvConsole'].buffer.text)
    p @glade
    view = @glade['tvConsole'].buffer.text+="test\n"
  end
end

# Main program
if __FILE__ == $0
  # Set values as your own application. 
  PROG_PATH = "twiform.glade"
  PROG_NAME = "YOUR_APPLICATION_NAME"
  o = TwiformGlade.new(PROG_PATH, nil, PROG_NAME)
  o.glade["wMain"].show_all
  Gtk.main
end
