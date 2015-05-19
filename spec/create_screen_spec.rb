require "create_screen"

describe CreateScreen do 
    it "outputs a name and adds a contact with the correct name" do
    input = StringIO.new("Emily\nSmith\n11.03.2014\n12 Cedar Way\nSL61RY")
    output = StringIO.new("")

    CreateScreen.new(input,output).show
   expect(output.string).to include("Emily")
end
end
