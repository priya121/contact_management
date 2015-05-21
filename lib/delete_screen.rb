require "dummy_contacts_display"
require "delete"

class DeleteScreen

    def initialize(contacts,input,output)
        @contacts = contacts
        @input = input
        @output = output
    end

    def title
        "Delete a contact"
    end

    def show 
        @output.puts "Enter the number of the contact you would like to delete:"
        id = @input.gets
        @output.puts "Are you sure you want to delete this contact?"
        confirmation = @input.gets
        if confirmation == "Y"
        puts Delete.new(@contacts,id).remove_contact
           puts "Contact successfully deleted" 
        else
            @input.gets == "N"
            @output.puts "#{ContactsDisplay::DUMMY_CONTACTS}"
        end
    end


end

