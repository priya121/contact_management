require "menu_chooser"
require "contact_chooser"
require "contact_persister"

describe MenuChooser do  
    let(:output) {StringIO.new("")}
    let(:persister) {double().as_null_object}
    let(:contacts) {double().as_null_object}

    it "displays list of screens" do
        input = StringIO.new("")
        chooser(input).show
        expect(output.string).to include("2) Search for a contact")
    end

    it "goes to the correct screen - viewscreen when 2 is entered" do
        input = StringIO.new("2\nY")
        puts chooser(input).show
        expect(output.string).to include("Enter a letter to filter or enter to select:")
    end

    it "goes to the create a contact page if 1 is entered" do
        input = StringIO.new("1\nSarah\nSmith\n04.10.1987\n12 cedar way\nKT78 0YH")
        chooser(input).show
        expect(output.string).to include("Create a contact")
    end

    it "goes to the delete a contact page if 4 is entered" do 
        input = StringIO.new("4")
        chooser(input).show
        expect(output.string.chomp).to include("Enter the number of the contact you would like to delete:")
    end

    it "goes to the update a contact page if 3 is entered" do 
        input = StringIO.new("3")
        chooser(input).show
        expect(output.string.chomp).to include("Choose a contact to Update:")
    end

    it "start loads a file" do
        input = StringIO.new("2\nY\nY")
        expect(persister).to receive(:load_json)
        chooser(input).start
    end

    it "start saves a file" do 
        input = StringIO.new("2\nY\nY")
        expect(persister).to receive(:save)
        chooser(input).start
    end

    def chooser(input)
        screens = [CreateScreenDouble,SearchScreenDouble,UpdateScreenDouble,DeleteScreenDouble]
        MenuChooser.new(persister,input,output,screens)
    end

    class CreateScreenDouble
        def initialize(contacts,input,output)
            @contacts = contacts
            @input = input
            @output = output
        end

        def title
            "Create a contact" 
        end

        def show
            @output.puts "Enter the fields you would like to change"
        end
    end

    class SearchScreenDouble
        def initialize(contacts,input,output)
            @contacts = contacts
            @input = input
            @output = output
        end

        def title
            "Search for a contact" 
        end

        def show
            @output.puts "Enter a letter to filter or enter to select:"
        end
    end

    class UpdateScreenDouble
        def initialize(contacts,input,output)
            @contacts = contacts
            @input = input
            @output = output
        end

        def title
            "Update a contact" 
        end

        def show
            @output.puts "Choose a contact to Update:"
        end
    end

    class DeleteScreenDouble
        def initialize(contacts,input,output)
            @contacts = contacts
            @input = input
            @output = output
        end

        def title
            "Delete a contact" 
        end

        def show
            @output.puts "Enter the number of the contact you would like to delete:"
        end
    end

    class ScreenDouble
        def initialize(contacts,input, output)
            @contacts = contacts
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

    class ContactPersisterDouble
        def load_json
            json = ContactsDisplay::DUMMY_CONTACTS.to_json
        end

        def save(contacts)
            "Samuel"
        end
    end
end
