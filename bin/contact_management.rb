#! usr/bin/env ruby 

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require "menu_chooser"
MenuChooser.new(@contacts,Kernel,Kernel).start
puts "\e[H\e[2J"
