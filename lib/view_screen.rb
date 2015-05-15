require "dummy_contacts_display"

class ViewScreen

    def initialize(input, output)
        @input = input
        @output = output
    end

    def title
        "View a contact"
    end

    def show
        @output.puts "Which contact would you like to view?"
        ContactsDisplay::DUMMY_CONTACTS.each do |key|
            @output.puts "#{key[:first_name]} #{key[:last_name]}"
        end 
    end

    def perform_action
        @output.puts Read.new(@input.gets.to_i).fetch_contact
    end
end

