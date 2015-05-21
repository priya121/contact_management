require "delete"
    describe Delete do 
        describe "#remove_contact" do
            it "deletes a contact when a user selects a contact" do 
                contacts = ContactsDisplay::DUMMY_CONTACTS
                delete = Delete.new(contacts,4)
                expect(delete.remove_contact).not_to include("Sam")
            end
        end
    end
