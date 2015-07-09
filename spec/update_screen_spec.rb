require "dummy_contacts_display"
require "update"
require "update_screen"

describe UpdateScreen do 
    let(:output) {StringIO.new("")}
    EMILY = {:first_name => "Emily", :last_name => "Jones"}
    ERIN = {:first_name => "Erin", :last_name => "Foster"}
    SANDRA = {:first_name => "Sandra", :last_name => "Lopez"}

    it "updates a dummy contact display with the new details a user enters details" do 
        @input = StringIO.new("Sa\n1\nY\nAlex")
        @contacts = [EMILY,ERIN,SANDRA]
        update_contact
        expect(output.string).to include("Alex")
    end 

    it "Filters a contact to update" do
      @input = StringIO.new("\nEmily\n1\nY\nAlex")
      @contacts = EMILY,SANDRA,ERIN
      update_contact
      expect(output.string.scan(/Emily/).length).to eq(1)
    end

    it "Asks the user to enter a letter filter or select" do
      @input = StringIO.new("\nEr\n2\nY\n")
      @contacts = EMILY,ERIN,SANDRA
      update_contact
      expect(output.string).to include("Enter a letter to filter or hit enter to select a contact")
    end

    it 'Asks the user if they are sure they want to update the contact?' do
      @input = StringIO.new("\nEr\n1\nY\n")
      @contacts = EMILY,ERIN,SANDRA
      update_contact
      expect(output.string).to include("Are you sure you want to update the following contact? (Y/N): Sandra Lopez")
    end

    def update_contact
      UpdateScreen.new(@contacts,@input,output).show
    end
end
