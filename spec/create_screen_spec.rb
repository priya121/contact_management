require "create_screen"
require "contact_persister"

describe CreateScreen do 
    let(:loaded_file) {ContactPersisterDouble.new.load}

    it "outputs a name and adds a contact with the correct name" do
        input = StringIO.new("Emily\nSmith\n11.03.2014\n12 Cedar Way\nSL61RY")
        output = StringIO.new("")

        CreateScreen.new(loaded_file,input,output).show
        expect(output.string).to include("Emily")
    end

        class ContactPersisterDouble

            def load
                ContactsDisplay::DUMMY_CONTACTS
            end

            def save(contacts)
            end

        end
end

