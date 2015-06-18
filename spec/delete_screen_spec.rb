require "delete_screen"
require "delete"
require "contact_persister"

describe DeleteScreen do 
    let(:output) {StringIO.new("")}
    let(:loaded_file) {ContactPersisterDouble.new.load}

    xit "Displays - contact successfully deleted when a user deletes a contact" do  
        @input = StringIO.new("1\n1\nY\n")
        delete = DeleteScreen.new(loaded_file,@input,output).show
        expect(output.string).to include("Contact successfully deleted")
    end

    xit "updates the dummy hash so that it no longer contains the deleted contact" do
        @input = StringIO.new("4\nY\n")
        delete = DeleteScreen.new(loaded_file,@input,output).show
        expect(output.string).to include("Contact successfully deleted")
    end
    
    it "returns a full display of contacts if the user enters N" do 
        @input = StringIO.new("1\nN")
        delete = DeleteScreen.new(loaded_file,@input,output).show
        expect(output.string).to include("Anna")
    end

        class ContactPersisterDouble

            def load
                ContactsDisplay::DUMMY_CONTACTS
            end

            def save(contacts)
            end

        end
end
