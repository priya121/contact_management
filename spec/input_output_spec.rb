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
        input = StringIO.new("1")
        output = StringIO.new("")
        chooser = InputOutput.new(input, output, [ViewScreen, ScreenDouble])
        chooser.show
        expect(output.string).to include("1) View a contact")
        expect(output.string).to include("2) Test")
    end

    it "goes to the correct screen" do
        input = StringIO.new("2")
        output = StringIO.new("")
        chooser = InputOutput.new(input, output, [ViewScreen,ScreenDouble])
        chooser.show
        expect(output.string).to include("This is a test screen")
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


