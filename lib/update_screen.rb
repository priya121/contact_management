require "contact_chooser"
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
        @output.puts "Choose a contact to Update:"
        list = ContactChooser.new(@contacts,@input,@output).show_contacts_list
        chosen_id = ContactChooser.new(@contacts,@input,@output).contact_chosen
        @output.puts "Enter the details of any changes you would like to make:"
        contacts_hash = ContactsDisplay::DUMMY_CONTACTS
        old_first_name = contacts_hash[chosen_id.to_i][:first_name]
        @output.puts "Current First Name: #{old_first_name}"
        @output.puts "New First Name (leave blank to keep):"
        first_name = @input.gets
        first_name = old_first_name if first_name == ""
        old_last_name = contacts_hash[chosen_id.to_i][:last_name]
        surname = "Current Last Name: #{old_last_name}"
        @output.puts surname
        @output.puts "New Last Name (leave blank to keep):"
        last_name = @input.gets
        updated_contact = Update.new(contacts_hash,first_name,last_name,chosen_id)
        @output.puts updated_contact.update
    end
end
