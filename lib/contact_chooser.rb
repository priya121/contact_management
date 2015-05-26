require "dummy_contacts_display"
require "input_output"

class ContactChooser
    def initialize(contacts,input,output)
        @contacts = contacts
        @input = input
        @output = output
    end

    def show_contacts_list
        @contacts = ContactsDisplay::DUMMY_CONTACTS
        @contacts.each_with_index do |key,i|
            @output.puts "#{i+1}) #{key[:first_name]} #{key[:last_name]}"
        end 
    end

    def contact_chosen 
        contact = @input.gets.to_i-1
       #display =  Read.new(@contacts,contact_chosen).fetch_contact
        @output.puts contact
    end
end


