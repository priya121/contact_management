require 'contact_searcher'

class SearchScreen 
    def initialize(contacts,input,output)
        @contacts = contacts
        @input = input
        @output = output
    end

    def show_filtered_contacts
        @output.puts "Enter the first character of the contact to filter or enter the number of the contact you would like to view"
        contact_id = @input.gets
        if contact_id.is_a?(Integer) && contact_id > 1 
            @output.puts @contacts[contact_id - 1]
        else 
            @output.puts ContactSearcher.new(@contacts).filtered_array(contact_id.to_s)
        end
    end
end
