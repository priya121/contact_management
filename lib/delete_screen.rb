require "dummy_contacts_display"
require "delete"

class DeleteScreen

    def initialize(input,output)
        @input = input
        @output = output
    end

    def title
        "Delete a contact"
    end

    def show 
        @output.puts "Enter the number of the contact you would like to delete:"
    end

  def perform_action
   Delete.new(@input.gets.to_i,@input).remove_contact 
  end

end
