require "view_screen"

describe ViewScreen do  
    describe "#perform_action" do
        it "shows contact details of Emma Jones when key 3 is pressed" do 
            @input = StringIO.new("3")
            @output = StringIO.new
            find_three = ViewScreen.new(@input,@output)
            find_three.perform_action
            expect(@output.string.chomp).to start_with("{:first_name=>\"Emma\",")
        end
    end
end


