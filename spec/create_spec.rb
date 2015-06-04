require "create"

    describe Create do
        describe "#add_contact" do
            it "adds a new contact, when the relevant details are entered" do 
                new_contact = Create.new("Sara","Evans","04.11.1988", "35 Guildford Road", "GU22 1EY")
                result = new_contact.add_contact
                expect(result).to include({:first_name => "Sara", :last_name => "Evans",:dob => "04.11.1988",:address => "35 Guildford Road", :postcode => "GU22 1EY"})
            end
        end
    end
