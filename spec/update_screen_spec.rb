require "dummy_contacts_display"
require "update"
require "update_screen"

describe UpdateScreen do 
    let(:loaded_file) {ContactPersisterDouble.new.load}

    it "updates a dummy contact display with the new details a user enters" do 
        input = StringIO.new("3\nAlex\nJones")
        output = StringIO.new("")
        UpdateScreen.new(loaded_file,input,output).show
        expect(output.string).to include("Alex")
    end 

    class ContactPersisterDouble
        def load
            ContactsDisplay::DUMMY_CONTACTS
        end

        def save(contacts)
        end
    end
end
