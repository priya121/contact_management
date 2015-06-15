require "create_screen"
require "contact_persister"

describe CreateScreen do 
    let(:file) {ContactPersister.new('/Users/priya10487/.con_man/db2.rb')}
    let(:loaded_file) {file.load}

    it "outputs a name and adds a contact with the correct name" do
        input = StringIO.new("Emily\nSmith\n11.03.2014\n12 Cedar Way\nSL61RY")
        output = StringIO.new("")

        CreateScreen.new(loaded_file,input,output).show
        expect(output.string).to include("Emily")
    end
end
