require "delete"
    describe Delete do 
        before do 
            @contacts = ContactsDisplay::DUMMY_CONTACTS
        end
        describe "#remove_contact" do
            it "deletes a contact when a user selects a contact" do 
                input = StringIO.new("4")
                delete = Delete.new(@contacts,input,output)
                expect(delete.remove_contact).not_to include("Sam")
            end
        end
    end
