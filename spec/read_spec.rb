require "read"

describe Read do
      ANNA = {:first_name => "Anna", :last_name => "Rose"}
      SANDRA = {:first_name => "Sandra", :last_name => "Long"}
      ERIC = {:first_name => "Eric", :last_name => "White"}

    describe "#fetch contact" do 
      contacts = [ANNA,SANDRA,ERIC]
        it "returns the second contact if 2 is entered" do 
            read = Read.new(contacts,2)
            expect(read.fetch_contact).to eq({:first_name=>"Sandra", :last_name => "Long"})
        end
    end
end
