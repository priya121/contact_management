require "input_output"

describe InputOutput do  


    it "displays first screen" do
        input = StringIO.new("1")
        output = StringIO.new("")
        chooser = InputOutput.new(input, output, [ViewScreen])
        chooser.show
        expect(output.string).to include("1) View a contact")
    end

    xit "displays list of screens" do
        input = StringIO.new("2")
        output = StringIO.new("")
        chooser = InputOutput.new(input, output, [ViewScreen, ScreenDouble])
        chooser.show
        expect(output.string).to include("1) View a contact")
        expect(output.string).to include("2) Test")
    end

    it "goes to the correct screen" do
        input = StringIO.new("2")
        output = StringIO.new("")
        chooser = InputOutput.new(input, output, [ScreenDouble,ViewScreen])
        chooser.show
        expect(output.string).to include("Which contact would you like to view?")
    end

    it "goes to the create a contact page if 1 is entered" do
        input = StringIO.new("1")
        output = StringIO.new("")
        chooser = InputOutput.new(input, output, [CreateScreen,ViewScreen,ScreenDouble])
        chooser.show
        expect(output.string).to include("Create a contact")
    end


    class ScreenDouble
        def initialize(input, output)
            @input = input
            @output = output
        end

        def title
            "Test"
        end

        def show
            @output.puts "This is a test screen"
        end
    end
    
    

end


