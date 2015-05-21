require "dummy_contacts_display"
require "update"

class UpdateScreen
    def initialize(contacts,input, output)
        @contacts = contacts
        @input = input
        @output = output
    end

    def title
        "Update a contact"
    end


    def show 
        @output.puts "Enter the details of any changes you would like to make:"
        @output.puts "Choose a contact to Update #{ContactsDisplay::DUMMY_CONTACTS}"
        id_number = @input.gets
        old_name = ContactsDisplay::DUMMY_CONTACTS[id_number.to_i][:first_name]
        @output.puts "Current Name: #{old_name}"
        @output.puts "New First Name (leave blank to keep):"
        first_name = @input.gets
        if first_name == "\n"
            first_name = "#{old_name}" 
        end
       @output.puts "New Last Name (leave blank to keep):"
        last_name = @input.gets
        @output.puts "#{Update.new(@contacts,first_name,last_name,id_number).update}"
    end
end
