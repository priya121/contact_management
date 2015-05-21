require "delete"
    describe Delete do 
        describe "#remove_contact" do
            it "deletes a contact when a user selects a contact" do 
                delete = Delete.new(1)
                expect(delete.remove_contact).to eq({})
            end
        end
    end
