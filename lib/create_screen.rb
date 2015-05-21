require "dummy_contacts_display"
require "create"

class CreateScreen

    def initialize(input,output)
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
        @output.print "dob:"
        @dob = @input.gets
        @output.print "Address:"
        @address = @input.gets
        @output.print "Postcode:"
        @postcode = @input.gets

        @add_contact = Create.new(@first_name,@last_name,@dob,@address,@postcode).add_contact

        added_entry = ContactsDisplay::DUMMY_CONTACTS[@add_contact.length - 1]
        @output.puts added_entry 
    end 

end



