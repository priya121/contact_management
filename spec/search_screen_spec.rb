require 'dummy_contacts_display'
require 'search_screen'

describe FilterSubscreen do 
    EMMA = {:first_name => "Emma", :last_name => "Evans"}
    SAM = {:first_name => "Sam", :last_name => "Patil"}
    DANIEL = {:first_name => "Daniel", :last_name => "Irvine"}
    DEBORAH = {:first_name => "Deborah", :last_name => "Lee"}
    ANNA = {:first_name => "Anna", :last_name => "Smith"}
    ANABEL = {:first_name => "Anabel", :last_name => "Smith"}

    let(:output) {StringIO.new("")}
    let(:get_char_double) {get_char_double}

    it 'returns 0 contacts if 0 contacts in the system' do 
      @contacts = []
      @input = StringIO.new("\n")
      show
      expect(output.string).to eq("There are no contacts.")
    end

    it 'chooses between two contacts' do 
      @contacts = [EMMA,SAM]
      @input = StringIO.new("\n1\n")
      show
      expect(output.string.scan(/Emma/).length).to eq(1)
    end
    
    it 'displays two contacts' do 
      @contacts = [EMMA,SAM]
      @input = StringIO.new("\n1\n")
      show
      expect(output.string).to include("1) Emma Samuels")
      expect(output.string).to include("2) Sam Patil")
    end

    it 'displays one contact' do
      @contacts = [DANIEL, DEBORAH]
      @input = StringIO.new("Deb\n1\n1")
      show
      expect(output.string.scan(/Deborah/).length).to eq(4)
      expect(output.string.scan(/Daniel/).length).to eq(2)
    end

    it 'asks the user for a letter or to select' do 
      @contacts = [EMMA, SAM]
      @input = StringIO.new("\n1\n")
      show
      expect(output.string).to include("Enter a letter to filter or select a contact")
    end

    it 'displays a filtered list when user enters Ann' do
    @contacts = [ANNA, ANABEL, DANIEL]
    @input = StringIO.new("Ann\n1\n")
    show
    expect(output.string).to include("Showing 2 of 15 contacts.")
    end

    it 'returns a full list when the user hits enter' do
      @contacts = [DANIEL,DEBORAH,ANNA,ANABEL,SAM,EMMA]
      @input = StringIO.new("\n1\n")
      show
      expect(output.string).to include("6) Emma Samuels")
    end

    it 'asks the user to enter from a filtered list' do
      @contacts = [DANIEL,DEBORAH,ANNA,ANABEL,SAM,EMMA]
      @input = StringIO.new("A\n1\n")
      show
      expect(output.string.scan(/Anna/).length).to eq(2)
    end

    it 'shows 15 of the total contacts when filtering contacts' do 
      @contacts = [DANIEL,DEBORAH,ANNA,ANABEL,SAM,EMMA,DANIEL,ANNA,DANIEL,SAM,DEBORAH,ANNA,DANIEL,DEBORAH,EMMA]
      @input = StringIO.new("A\n\n")
      show
      expect(output.string).to include("Showing 4 of 15 contacts")
    end

    it 'displays - There are no contacts - for empty contact' do
      @contacts = []
      @input = StringIO.new("\n")
      show
      expect(output.string).to include("There are no contacts.")
    end

    it 'displays contact if there is only one contact with typed name after filtering' do 
      @contacts = [DANIEL,DEBORAH,ANNA,ANABEL,SAM,EMMA,DANIEL,ANNA,DANIEL,SAM,DEBORAH,ANNA,DANIEL,DEBORAH,EMMA]

    end

    xit 'asks the user if they would like to see the details of the filtered user' do
      @contacts = [DANIEL,DEBORAH,ANNA,ANABEL,SAM,EMMA,DANIEL,ANNA,DANIEL,SAM,DEBORAH,ANNA,DANIEL,DEBORAH,EMMA]
      @input = StringIO.new("A\n\n")
      show
      expect(output.string).to include("Press enter if you would like to see the contact details of the filtered contact?")
end

    def show
      FilterSubscreen.new(@contacts,@input,output).show
    end
end
