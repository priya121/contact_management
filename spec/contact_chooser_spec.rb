require "contact_chooser"
require "dummy_contacts_display"

describe ContactChooser do 
    before do
        @contacts = ContactsDisplay::DUMMY_CONTACTS
    end
    it "displays a list of contacts to the user" do 
        output = StringIO.new("")
        ContactChooser.new(@contacts,output).user_chooses_contact
        expect(output.string).to include("Which contact would you like to view?")
    end
end

