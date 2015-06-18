require "dummy_contacts_display"
require "menu_chooser"

class ContactChooser
    def initialize(contacts,input,output)
        @contacts = contacts
        @input = input
        @output = output
    end

    def show_contacts_list
        @contacts.each_with_index do |key,i|
            @output.puts "#{i+1}) #{key[:first_name]} #{key[:last_name]}"
        end 
    end

    def contact_chosen 
       @input.gets.to_i - 1
    end
end


