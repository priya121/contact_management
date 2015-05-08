require "contacts_management"
describe "contact management program" do
    before do 
        @output = StringIO.new
    end

    it "shows contact details of Anna Smith when key 1 is pressed" do 
        @input = StringIO.new("1")
        view = contact_management.read
        expect(@output.string.chomp).to start_with("{:name=>\"Anna Smith\",")
    end

    it "shows contact details of Emma Jones when key 3 is pressed" do 
        @input = StringIO.new("3")
        view = contact_management.read
        expect(@output.string.chomp).to start_with("{:name=>\"Emma Jones\",")
    end

    it "exits to the main page when a user presses any key" do
        @input = StringIO.new("l")
        view = contact_management.read
        expect(@output.string.chomp).to eq("main page")
    end

    def contact_management
        ContactManagement.new(@input,@output)
    end
end
