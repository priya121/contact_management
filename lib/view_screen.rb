require "filter_subscreen"
require "contact_searcher"
require "dummy_contacts_display"
require "read"
require "contact_chooser"

class ViewScreen

    def initialize(contacts,input,output)
        @contacts = contacts
        @input = input
        @output = output
    end

    def title
        "View a contact"
    end

    def show
        selected_contact = FilterSubsreen.new(@contacts,@input,@output).show 
        @output.puts "Enter the number of the contact would you like to view or enter the first character of their first name to filter:"
        contacts_list = ContactChooser.new(@contacts,@input,@output).show_contacts_list
        index = ContactChooser.new(@contacts,@input,@output).contact_chosen
        @output.puts "First Name: #{contacts_list[index.to_i][:first_name]}"
        @output.puts "Last Name: #{contacts_list[index.to_i][:last_name]}"
        @output.puts "D.O.B (dd.mm/yyyy): #{contacts_list[index.to_i][:dob]}"
        @output.puts "Address: #{contacts_list[index.to_i][:address]}"
        @output.puts "Postcode: #{contacts_list[index.to_i][:postcode]}"
    end
end

