require "dummy_contacts_display"
require "update"

class UpdateScreen
    def initialize(input, output)
        @input = input
        @output = output
    end

    def title
        @output.puts "Update a contact"
    end


    def show 
        @output.puts "Enter the details of any changes you would like to make:"
    end

    def perform_action 
       @output.puts Update.new(@input).update 
    end

end
