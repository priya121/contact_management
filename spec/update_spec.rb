require "update"

describe Update do
    before do 
        @contacts = ContactsDisplay::DUMMY_CONTACTS
    end

    describe "#update" do 
        it "updates a contact with new data when a new field is entered" do 
            result = Update.new(@contacts,"Erica","Simpson",3).update
            expect(result).to include({:first_name => "Erica", :last_name => "Simpson"})
        end
    end
end
