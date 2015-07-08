require "dummy_contacts_display"
require "update"
require "update_screen"

describe UpdateScreen do 
    let(:output) {StringIO.new("")}
    EMILY = {:first_name => "Emily", :last_name => "Jones"}
    ERIN = {:first_name => "Erin", :last_name => "Foster"}
    SANDRA = {:first_name => "Sandra", :last_name => "Lopez"}
    EMMA = {:first_name => "Emma", :last_name => "Samuels"}

    xit "updates a dummy contact display with the new details a user enters" do 
        input = StringIO.new("S\n1\nY\nAlex\nJerome\n12.12.1993\n13 Cedar Way\nSL5 1RY")
        contacts = [EMILY,ERIN,SANDRA,EMMA]
        UpdateScreen.new(contacts,input,output).show
        expect(output.string).to include("Alex")
    end 

    it "Filters a contact to update" do
      @input = StringIO.new("\nEmily\n1\nY\n")
      @contacts = EMILY,SANDRA,ERIN,EMMA
      UpdateScreen.new(@contacts,@input,output).show
      expect(output.string.scan(/Emily/).length).to eq(2)
    end

    it "Asks the user to enter a letter filter or select" do
      @input = StringIO.new("Er\n2\nY\n")
      @contacts = EMILY,ERIN,SANDRA
      UpdateScreen.new(@contacts,@input,output).show
      expect(output.string).to include("Enter a letter to filter or select a contact")
    end

    it 'Asks the user if they are sure they want to update the contact?' do
      @input = StringIO.new("\nEr\n1\nY\n")
      @contacts = EMILY,ERIN,SANDRA,EMMA
      UpdateScreen.new(@contacts,@input,output).show
      expect(output.string).to include("Are you sure you want to update the following contact? (Y/N)")
    end

    it "filters contacts to be updated" do
      @contacts = EMILY,ERIN,SANDRA,EMMA
      @input = StringIO.new("\nErin\n1\nY")
      UpdateScreen.new(@contacts,@input,output).show
      expect(output.string.scan(/Erin Foster/).length).to eq(2)
    end
end
