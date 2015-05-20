require "delete_screen"
require "delete"

describe DeleteScreen do 
    it "Deletes a contact when a user chooses the contact by entering the id of that contact" do  
        @input = StringIO.new("2")
        @output = StringIO.new("")
        delete = DeleteScreen.new(@input,@output)
        expect(@output.string).to include("{}")
    end
end
