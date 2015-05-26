require "contact_chooser"
require "dummy_contacts_display"

describe ContactChooser do 
    before do
        @contacts = ContactsDisplay::DUMMY_CONTACTS
    end
    it "displays a list of contacts to the user" do 
        input = StringIO.new("3")
        output = StringIO.new("")
        chooser = ContactChooser.new(@contacts,input,output)
        chooser.show_contacts_list
        expect(output.string).to include("1) Anna Smith")
    end

    it "takes an input from the user and returns the relevant contact index" do 
        input = StringIO.new("1")
        output = StringIO.new("")
        chooser = ContactChooser.new(@contacts,input,output)
        result = chooser.contact_chosen
        expect(output.string).to start_with("0")
    end
end

