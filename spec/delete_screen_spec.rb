require "dummy_contacts_display"
require "delete_screen"
require "delete"

describe DeleteScreen do 
    before do 
        @contacts = ContactsDisplay::DUMMY_CONTACTS 
    end

    xit "Displays - contact successfully deleted when a user deletes a contact" do  
        @input = StringIO.new("2\nY")
        @output = StringIO.new("")
        delete = DeleteScreen.new(@contacts,@input,@output).show
        expect(@output.string).to include("Contact successfully deleted")
    end

    xit "updates the dummy hash so that it no longer contains the deleted contact" do
        @input = StringIO.new("2\nY\n")
        @output = StringIO.new("")
        delete = DeleteScreen.new(@input,@output).show
        expect(@output.string).to include("Contact successfully deleted")
    end
    
    xit "returns a full display of contacts if the user enters N" do 
        @input = StringIO.new("1\nN")
        @output = StringIO.new("")
        delete = DeleteScreen.new(@input,@output).show
        expect(@output.string).to eq("Enter the number of the contact you would like to delete:\nAre you sure you want to delete this contact?\n#{ContactsDisplay::DUMMY_CONTACTS}\n")
    end
end
