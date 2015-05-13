require "contact_management"
describe "contact management program" do
before do 
    @output = StringIO.new
end
it "shows all the contact details as soon as the page is loaded" do
    display_contacts = ContactsDisplay::DUMMY_CONTACTS
    expect(display_contacts).to start_with({:first_name=>"Anna", :last_name=>"Smith", :dob=>"10.03.1989", :address=>"12 Forlease Road", :postcode=>"SW9 0LG"})
end

it "returns the second contact if 2 is entered" do 
    read = Read.new(2)
    expect(read.fetch_contact).to eq({:first_name=>"Bob", :last_name => "Smith", :dob=> "02.12.1988", :address=> "10 Cedars Road", :postcode=> "KT11 1RY"})
end

it "shows contact details of Emma Jones when key 3 is pressed" do 
    @input = StringIO.new("3")
    @output = StringIO.new
    find_three = InputOutput.new(@input,@output)
    find_three.data_input_output_view
    expect(@output.string.chomp).to start_with("{:first_name=>\"Emma\",")
end

it "goes back to main menu when another key is pressed" do 
    @input = StringIO.new("l")
    @output = StringIO.new
    find_three = InputOutput.new(@input,@output)
    find_three.data_input_output_view
    expect(@output.string.chomp).to end_with("main page")
end

it "adds a new contact, when the relevant details are entered" do 
    new_contact = Create.new("Sara","Evans","04.11.1988", "35 Guildford Road", "GU22 1EY")
        result = new_contact.add_contact
        expect(result).to include({:name => "Sara Evans",:dob => "04.11.1988",:address => "35 Guildford Road", :postcode => "GU22 1EY"})
end
  
    it "updates a contact with new data when a new field is entered" do 
    result = Update.new("Erica Simpson",1).update
    expect(result).to include({:name => "Erica Simpson"})
    end

    it "deletes a contact when a user selects Y" do 
        delete = Delete.new(1,"Y")
        expect(delete.remove_contact).to eq({})
    end
end
