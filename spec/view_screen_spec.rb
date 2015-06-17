require "view_screen"
require "contact_chooser"
require "contact_persister"
require "tempfile"

describe ViewScreen do  
    let(:loaded_file) {ContactPersisterDouble.new.load}

    describe "#show" do
        it "shows contact details of Anna Smith when key 1 is pressed" do 
            @input = StringIO.new("1\n")
            @output = StringIO.new("")
            find_three = ViewScreen.new(loaded_file,@input,@output).show
            
            expect(@output.string).to include("Anna")
        end
    end

        class ContactPersisterDouble

            def load
                ContactsDisplay::DUMMY_CONTACTS
            end

            def save(contacts)
            end

        end
end


