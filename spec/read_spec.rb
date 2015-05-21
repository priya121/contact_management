require "read"

    describe Read do
        describe "#fetch contact" do 
            xit "returns the second contact if 2 is entered" do 
                read = Read.new(2)
                expect(read.fetch_contact).to eq({:first_name=>"Bob", :last_name => "Smith", :dob=> "02.12.1988", :address=> "10 Cedars Road", :postcode=> "KT11 1RY"})
            end
        end
    end
