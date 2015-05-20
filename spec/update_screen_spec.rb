require "dummy_contacts_display"
require "update"
require "update_screen"

describe UpdateScreen  do 
    it "updates a dummy contact display with the new details a user enters" do 
        input = StringIO.new("1\nAlex\nJones")
        output = StringIO.new("")
        UpdateScreen.new(input,output).show
        expect(output.string).to include("Alex")
    end
end
