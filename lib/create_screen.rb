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
    end

    def perform_action
        new_contact =  Create.new(@input).add_contact
        @output.puts "#{new_contact}"
    end
end
