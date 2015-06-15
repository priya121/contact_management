require "contact_persister"
require "contact_chooser"
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
        chosen_id = ContactChooser.new(@contacts,@input,@output).contact_chosen
        puts chosen_id
        @output.puts "Are you sure you want to delete this contact?"
        confirmation = @input.gets
        puts confirmation
        if confirmation == "Y\nY"
        deleted_contact = Delete.new(@contacts,chosen_id,@output).remove_contact
        @output.puts deleted_contact
           @output.puts "Contact successfully deleted" 
        else
            @input.gets == "N"
            @output.puts @contacts
        end
    end
end

