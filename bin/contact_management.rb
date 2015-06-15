#! usr/bin/env ruby 

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require "menu_chooser"
require "contact_persister"

contacts_file_path = '/Users/priya10487/.con_man/db.rb'

begin
    contacts = ContactPersister.new(contacts_file_path).load
    MenuChooser.new(contacts,Kernel,Kernel).start
    puts "\e[H\e[2J"
rescue ContactLoadError
    puts "Con Man (tm): Contacts cannot be loaded in #{contacts_file_path}"
end
