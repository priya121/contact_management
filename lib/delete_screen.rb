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
        list = ContactChooser.new(@contacts,@input,@output).show_contacts_list
        @output.puts "#{list}"
        id = @input.gets.to_i
        @output.puts "Are you sure you want to delete this contact?"
        confirmation = @input.gets
        if confirmation == "Y"
        deleted_contact = Delete.new(@contacts,id).remove_contact
        @output.puts deleted_contact
           @output.puts "Contact successfully deleted" 
        else
            @input.gets == "N"
            @output.puts "#{ContactsDisplay::DUMMY_CONTACTS}"
        end
    end


end

