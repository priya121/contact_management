require "contact_persister"
require "contact_chooser"
require "delete"
require "filter_subscreen"

class DeleteScreen

  def initialize(contacts,input,output)
    @contacts = contacts
    @input = input
    @output = output
  end

  def title
    "Delete a contact"
  end

  def show 
    @output.puts "Select a contact to delete:"
    screen = FilterSubscreen.new(@contacts,@input,@output)
     filtered_contact = screen.show
    result = @contacts.index(filtered_contact)
    @output.puts "Are you sure you want to delete this contact?"
    confirmation = @input.gets.chomp
    if confirmation == "Y"
      deleted = Delete.new(@contacts,result,@output)
      deleted_contact = deleted.remove_contact
      @output.puts "The contact #{deleted_contact[:first_name] } #{deleted_contact[:last_name]} has been deleted from contacts."
      @output.puts "Contact successfully deleted" 
    else
      @output.puts @contacts
    end
  end
end
