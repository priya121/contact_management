require 'contact_searcher'

class SearchScreen 
    def initialize(contacts,input,output)
        @contacts = contacts
        @input = input
        @output = output
    end

    def title 
      "Search" 
    end

    def show
    
     
    end

    def show_filtered_contacts
       @output.puts ContactSearcher.new(@contacts,@input,@output).filtered_array(@input)
    end
end
