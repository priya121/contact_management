require "contact_management"
describe "contact management program" do
    before do 
        @output = StringIO.new
    end

    it "shows all the contact details as soon as the page is loaded" do
        view = contact_management.dummy_contacts
        expect(view).to start_with({:name=>"Anna Smith", :dob => "10.03.1989", :address => "12 Forlease Road", :postcode => "SW9 0LG"})
    end

    it "shows contact details of Anna Smith when key 1 is pressed" do 
        @input = StringIO.new("1")
        view = contact_management.data_input_output
        expect(@output.string.chomp).to start_with("{:name=>\"Anna Smith\",")
    end

    it "shows contact details of Emma Jones when key 3 is pressed" do 
        @input = StringIO.new("3")
        view = contact_management.data_input_output
        expect(@output.string.chomp).to start_with("{:name=>\"Emma Jones\",")
    end

    xit "exits to the main page when a user presses any key" do
        @input = StringIO.new("l")
        view = contact_management.read
        expect(@output.string.chomp).to eq("main page")
    end

    def contact_management
        ContactManagement.new(@input,@output)
    end
end
