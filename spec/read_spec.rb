require "read"

describe Read do
    before do
        @contacts = ContactsDisplay::DUMMY_CONTACTS
    end
    describe "#fetch contact" do 
        it "returns the second contact if 2 is entered" do 
            read = Read.new(@contacts,2)
            expect(read.fetch_contact).to eq({:first_name=>"Annabel", :last_name => "Evans", :dob=> "11.12.1999", :address=> "01 Rosebury Av", :postcode=> "EC12 8CY"})
        end
    end
end
