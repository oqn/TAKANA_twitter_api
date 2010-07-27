#!/usr/bin/env ruby
# -*- codong: utf-8 -*-

require 'twiform.rb'

# Main program
if __FILE__ == $0
  # Set values as your own application. 
  PROG_PATH = "glade/twiform.glade"
  PROG_NAME = "TAKANA_TWITTER API"
  TAKANA_mainform.new(PROG_PATH, nil, PROG_NAME)
#  o.glade["wMain"].show_all
  Gtk.main
end
