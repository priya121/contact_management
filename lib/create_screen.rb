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
        @output.puts "Enter the relevant fields"
        ContactsDisplay::DUMMY_CONTACTS << {:name => "#{@first_name} #{@last_name}",:dob => "#{@dob}", :address => "#{@address}", :postcode => "#{@postcode}"}
    end

    def perform_action
        new_contact =  Create.new("Sara","Evans","04.11.1988", "35 Guildford Road", "GU22 1EY")
        @output.puts "#{new_contact}"
    end

end
