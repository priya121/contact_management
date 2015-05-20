require "delete"
    describe Delete do 
        describe "#remove_contact" do
            it "deletes a contact when a user selects Y" do 
                delete = Delete.new(1,"Y")
                expect(delete.remove_contact).to eq({})
            end
        end
    end
