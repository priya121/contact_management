require "contact_management"
describe "contact management program" do
    #before do 
    #    @output = StringIO.new
    #end

    it "shows all the contact details as soon as the page is loaded" do
        display_contacts = FindContact.new(1).dummy_contacts
        expect(display_contacts).to start_with({:name=>"Anna Smith", :dob => "10.03.1989", :address => "12 Forlease Road", :postcode => "SW9 0LG"})
    end

    it "returns the second contact if 2 is entered" do 
        read = FindContact.new(2)
        expect(read.fetch_contact).to start_with({:name=>"Bob Smith", :dob=> "02.12.1988", :address=> "10 Cedars Road", :postcode=> "KT11 1RY"})
                                                
    end

    it "returns - main page - if a non-integer is entered" do 
        read = FindContact.new("l")
        expect(read.fetch_contact).to end_with("main page")
    end


    it "shows contact details of Emma Jones when key 3 is pressed" do 
        @input = StringIO.new("3")
        @output = StringIO.new
        find_three = InputOutput.new(@input,@output)
        find_three.data_input_output
        expect(@output.string.chomp).to start_with("{:name=>\"Emma Jones\",")
    end


    #def read
    #    Read.new(@input)
    #end
end
