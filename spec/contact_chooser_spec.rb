require "contact_chooser"
require "dummy_contacts_display"

describe ContactChooser do 
    before do
        @contacts = ContactsDisplay::DUMMY_CONTACTS
    end
    it "displays a list of contacts to the user" do 
        input = StringIO.new("3")
        output = StringIO.new("")
        ContactChooser.new(@contacts,input,output).user_chooses_contact
        expect(output.string).to include("Which contact would you like to view?")
    end

    it "takes an input from the user and returns the relevant contact index" do 
        input = StringIO.new("1\n")
        output = StringIO.new("")
        ContactChooser.new(@contacts,input,output).user_chooses_contact
        expect(output.string).to include("2")
    end
end

