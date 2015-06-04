require "dummy_contacts_display"
require "create"

class CreateScreen

    def initialize(contacts,input,output)
        @contacts = contacts
        @input = input
        @output = output
    end

    def title
        "Create a contact"
    end

    def show
        @output.print "Enter the fields you would like to change:"
        @output.print "First name:"
        @first_name = @input.gets 
        @output.print "Last name:"
        @last_name = @last_name = @input.gets
        @output.print "dob (dd.mm.yyyy):"
        @dob = @input.gets
        @output.print "Address:"
        @address = @input.gets
        @output.print "Postcode:"
        @postcode = @input.gets

        @add_contact = Create.new(@first_name,@last_name,@dob,@address,@postcode).add_contact

        added_entry = ContactsDisplay::DUMMY_CONTACTS
        @output.puts "First Name: #{added_entry[@add_contact.length - 1][:first_name]}"
        @output.puts "Last Name: #{added_entry[@add_contact.length - 1][:last_name]}"
        @output.puts "DOB (dd.mm.yyyy): #{added_entry[@add_contact.length - 1][:dob]}"
        @output.puts "Address: #{added_entry[@add_contact.length - 1][:address]}"
        @output.puts "Postcode: #{added_entry[@add_contact.length - 1][:postcode]}"
    end 
end



