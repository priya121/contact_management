require "contact_chooser"
require "dummy_contacts_display"

describe ContactChooser do 

    let(:loaded_file) {ContactPersisterDouble.new.load}

    it "displays a list of contacts to the user" do 
        input = StringIO.new("3")
        output = StringIO.new("")
        chooser = ContactChooser.new(loaded_file,input,output)
        chooser.show_contacts_list
        expect(output.string).to include("1) Anna Smith")
    end

    it "takes an input from the user and returns the relevant contact index" do 
        input = StringIO.new("1")
        chooser = ContactChooser.new(loaded_file,input,output)
        result = chooser.contact_chosen
        expect(result).to eq(0)
    end

    class ContactPersisterDouble
        def load
            ContactsDisplay::DUMMY_CONTACTS
        end

        def save(contacts)
        end
    end

end

