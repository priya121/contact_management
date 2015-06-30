require "view_screen"
require "contact_persister"

describe ViewScreen do  
    let(:loaded_file) {ContactPersisterDouble.new.load}
    let(:input) {StringIO.new("A")}
    let(:output) {StringIO.new("")}

    describe "#show" do
        xit "shows Anna Smith when key 1 is pressed" do 
            ViewScreen.new(loaded_file,input,output).show
            expect(output.string).to include("Anna")
        end

        xit "shows Annabel Evans and Anna Smith when A is pressed" do
            ViewScreen.new(loaded_file,input,output).show
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
end
