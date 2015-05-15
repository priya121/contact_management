require "update"

    describe Update do
        describe "#update" do 
            it "updates a contact with new data when a new field is entered" do 
                result = Update.new("Erica","Simpson",1).update
                expect(result).to include({:first_name => "Erica", :last_name => "Simpson"})
            end
        end
    end
