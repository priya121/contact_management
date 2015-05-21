require "dummy_contacts_display"
require "input_output"

class ContactChooser
    def initialize(contacts,output)
        @contacts = contacts
        @output = output
    end

    def user_chooses_contact
       @output.puts "Which contact would you like to view?"
        @contacts.each_with_index do |key,i|
            @output.puts "#{i+1}) #{key[:first_name]} #{key[:last_name]}"
        end 
    end

end

