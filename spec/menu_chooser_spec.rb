require "menu_chooser"
require "contact_chooser"
require "contact_persister"

describe MenuChooser do  
    let(:output) {StringIO.new("")}
    let(:file) {ContactPersister.new('/Users/priya10487/.con_man/db2.rb')}
    let(:loaded_file) {file.load}

    it "displays first screen" do
        input = StringIO.new("2")
        chooser(input).show
        expect(output.string).to include("2) View a contact")
    end

    it "displays list of screens" do
        input = StringIO.new("")
        chooser(input).show
        expect(output.string).to include("2) View a contact")
    end

    it "goes to the correct screen - viewscreen when 2 is entered" do
        input = StringIO.new("2")
        chooser(input).show
        expect(output.string).to include("Which contact would you like to view?")
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
        expect(output.string.chomp).to include("Enter the details of any changes you would like to make:")
    end

    it "saves to a file" do
        contact_persister_double = instance_double("ContactPersister")
        input = StringIO.new("3")
        saved_contacts = {:first_name => "Samuel", :last_name =>"Ann"}
        saved_contacts_file = ContactPersisterDouble.new.save(saved_contacts)
        expect(saved_contacts_file).to include("Samuel")
    end
    def chooser(input)
        screens = [CreateScreen,ViewScreen,UpdateScreen,DeleteScreen]
        MenuChooser.new(loaded_file,input,output,screens)
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

        def load
            json = ContactsDisplay::DUMMY_CONTACTS.to_json
        end

        def save(contacts)
            "Samuel"
        end
    end
end
