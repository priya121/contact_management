require "dummy_contacts_display"
require "read"

class ViewScreen

    def initialize(contacts,input, output)
        @contacts = contacts
        @input = input
        @output = output
    end

    def title
        "View a contact"
    end

    def show
        @output.puts "Which contact would you like to view?"
        @contacts.each_with_index do |key,i|
            @output.puts "#{i+1}) #{key[:first_name]} #{key[:last_name]}"
        end 
        display =  Read.new(@contacts,@input.gets.to_i).fetch_contact
        @output.puts "#{display}"
    end
end

