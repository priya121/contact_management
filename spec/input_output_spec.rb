require "input_output"

describe InputOutput do  


    it "displays first screen" do
        input = StringIO.new("1")
        output = StringIO.new("")
        chooser = InputOutput.new(input, output, [ViewScreen])
        chooser.show
        expect(output.string).to include("1) View a contact")
    end

    it "displays list of screens" do
        input = StringIO.new("")
        output = StringIO.new("")
        chooser = InputOutput.new(input, output, [CreateScreen,ViewScreen])
        chooser.show
        expect(output.string).to include("1) Create a contact")
        expect(output.string).to include("2) View a contact")
    end

    it "goes to the correct screen - viewscreen when 2 is entered" do
        input = StringIO.new("2")
        output = StringIO.new("")
        chooser = InputOutput.new(input, output, [ViewScreen,ViewScreen])  
        chooser.show
        expect(output.string.chomp).to include("2) View a contact")
        expect(output.string).to include("Which contact would you like to view?")
    end

    it "goes to the create a contact page if 1 is entered" do
        input = StringIO.new("1")
        output = StringIO.new("")
        chooser = InputOutput.new(input, output, [CreateScreen,ViewScreen,ScreenDouble])
        chooser.show
        expect(output.string.chomp).to include("1) Create a contact")
        expect(output.string).to include("Create a contact")
    end

    it "goes to the delete a contact page if 4 is entered" do 
        input = StringIO.new("4")
        output = StringIO.new("")
        chooser = InputOutput.new(input, output, [CreateScreen,ViewScreen,ScreenDouble,DeleteScreen])
        chooser.show
        expect(output.string.chomp).to include("Enter the number of the contact you would like to delete:")
    end

    it "goes to the update a contact page if 3 is entered" do 
        input = StringIO.new("3")
        output = StringIO.new
        chooser = InputOutput.new(input, output, [CreateScreen,ViewScreen,UpdateScreen,DeleteScreen])
        chooser.show
        expect(output.string.chomp).to include("Enter the details of any changes you would like to make:")
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
