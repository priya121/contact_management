require "view_screen"
require "contact_chooser"

describe ViewScreen do  
    describe "#show" do
        before do 
            @contacts = ContactsDisplay::DUMMY_CONTACTS
        end
        it "shows contact details of Anna Smith when key 1 is pressed" do 
            @input = StringIO.new("1\n")
            @output = StringIO.new("")
            find_three = ViewScreen.new(@contacts,@input,@output).show
            
            expect(@output.string).to include("Anna\",")
        end
    end
end


