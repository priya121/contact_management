require "dummy_contacts_display"
require "delete"

class DeleteScreen

    def initialize(input,output)
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
        deleted_contact = Delete.new(id,confirmation).remove_contact
        @output.puts "#{deleted_contact}"
    end


end

