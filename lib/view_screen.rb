require "dummy_contacts_display"
require "read"
require "contact_chooser"

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
         contacts_list = ContactChooser.new(@contacts,@input,@output).show_contacts_list
        index = ContactChooser.new(@contacts,@input,@output).contact_chosen
   @output.puts contacts_list[index.to_i]
    end
end

