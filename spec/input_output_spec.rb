require "input_output"

    describe InputOutput do  
        describe "#data_input_output_view" do
            it "shows contact details of Emma Jones when key 3 is pressed" do 
                @input = StringIO.new("3")
                @output = StringIO.new
                find_three = InputOutput.new(@input,@output)
                find_three.data_input_output_view
                expect(@output.string.chomp).to start_with("{:first_name=>\"Emma\",")
            end
        end
    end

    describe "#data_input_output_view" do 
        it "goes back to main menu when another key is pressed" do 
            @input = StringIO.new("l")
            @output = StringIO.new
            find_three = InputOutput.new(@input,@output)
            find_three.data_input_output_view
            expect(@output.string.chomp).to end_with("main page")
        end
    end
