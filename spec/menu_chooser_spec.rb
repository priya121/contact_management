require "json"
require "tempfile"
require "menu_chooser"
require "contact_chooser"
require "view_screen"
require "contact_persister"

describe MenuChooser do  
    it "displays first screen" do
        input = StringIO.new("2")
        output = StringIO.new("")
        chooser = MenuChooser.new(@contact_persister,input,output, [ViewScreen,ViewScreen])
        chooser.show
        expect(output.string).to include("1) View a contact")
    end

    it "displays list of screens" do
        input = StringIO.new("")
        output = StringIO.new("")
        chooser = MenuChooser.new(@contact_persister,input, output, [CreateScreen,ViewScreen])
        chooser.show
        expect(output.string).to include("1) Create a contact")
        expect(output.string).to include("2) View a contact")
    end

    it "goes to the correct screen - viewscreen when 2 is entered" do
        input = StringIO.new("2")
        output = StringIO.new("")
        chooser = MenuChooser.new(@contact_persister,input, output, [ViewScreen,ViewScreen])  
        chooser.show
        expect(output.string.chomp).to include("2) View a contact")
        expect(output.string).to include("Which contact would you like to view?")
    end

    it "goes to the create a contact page if 1 is entered" do
        input = StringIO.new("1\nSarah\nSmith\n04.10.1987\n12 cedar way\nKT78 0YH")
        output = StringIO.new("")
        chooser = MenuChooser.new(@contacts_persister,input, output, [CreateScreen,CreateScreen,ViewScreen,ScreenDouble])
        chooser.show
        expect(output.string).to include("Create a contact")
    end

    it "goes to the delete a contact page if 4 is entered" do 
        input = StringIO.new("4")
        output = StringIO.new("")
        chooser = MenuChooser.new(@contact_persister,input, output, [CreateScreen,ViewScreen,ScreenDouble,DeleteScreen])
        chooser.show
        expect(output.string.chomp).to include("Enter the number of the contact you would like to delete:")
    end

    it "goes to the update a contact page if 3 is entered" do 
        input = StringIO.new("3")
        output = StringIO.new
        chooser = MenuChooser.new(@contacts_persister,input, output, [CreateScreen,ViewScreen,UpdateScreen,DeleteScreen])
        chooser.show
        expect(output.string.chomp).to include("Enter the details of any changes you would like to make:")
    end

    it "loads a file" do
        contact_persister_double = instance_double("ContactPersister", :load => ContactsDisplay::DUMMY_CONTACTS)
        input = StringIO.new("2")
        output = StringIO.new
        expect(contact_persister_double).to receive(:load)
        chooser = MenuChooser.new(contact_persister_double, input, output, [CreateScreen,ViewScreen,UpdateScreen,DeleteScreen])
        chooser.show
        expect(output.string).to include("Anna")
    end

    it "saves to a file" do
        contact_persister_double = instance_double("ContactPersister")
        input = StringIO.new("3")
        output = StringIO.new
        saved_contacts = {:first_name => "Sarah", :last_name =>"Ann"}
        chooser = MenuChooser.new(ContactPersisterDouble.new.save(saved_contacts), input, output,[CreateScreen,ViewScreen,UpdateScreen,DeleteScreen])
        saved_contacts_file = ContactPersisterDouble.new.save(saved_contacts)
        expect(saved_contacts_file).to include("Sarah")
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
            "Sarah"
        end
    end
end
