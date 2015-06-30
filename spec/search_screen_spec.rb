require 'dummy_contacts_display'
require 'search_screen'

describe SearchScreen do 
    EMMA = {:first_name => "Emma", :last_name => "Evans"}
    SAM = {:first_name => "Sam", :last_name => "Patil"}
    DANIEL = {:first_name => "Daniel", :last_name => "Irvine"}
    DEBORAH = {:first_name => "Deborah", :last_name => "Lee"}

    let(:output) {StringIO.new("")}
    let(:get_char_double) {get_char_double}

    it 'returns 0 contacts if 0 contacts in the system' do 
      @contacts = []
      @input = StringIO.new("\n")
      show
      expect(output.string).to eq("There are no contacts.")
    end

    it 'chooses betwen two contacts' do 
      @contacts = [EMMA,SAM]
      @input = StringIO.new("1\n")
      show
      expect(output.string.scan(/Emma/).length).to eq(2)
    end
    
    it 'displays two contacts' do 
      @contacts = [EMMA,SAM]
      @input = StringIO.new("1\n")
      show
      expect(output.string).to include("1) Emma Evans")
      expect(output.string).to include("2) Sam Patil")
    end

    xit 'displays one contact' do
      @contacts = [DEBORAH, DANIEL]
      @input = StringIO.new("D\n1\n")
      show
      expect(output.string.scan(/Deborah/).length).to eq(3)
    end

    def show
      SearchScreen.new(@contacts,@input,output).show
    end

    xit 'returns 1 contact if 1 contact in the system' do 
    input = StringIO.new("E")
    contacts = [{:first_name => "Emma", 
                 :last_name => "Jones", 
                 :dob => "12.08.1997", 
                 :address => "11 Emerald Road", 
                 :postcode => "EC1Y SXY"}]
    filtered_contacts = SearchScreen.new(contacts,input,output).show
    expect(output.string).to include("Emma")
    #also test length
    #test location 0
    end

    xit 'returns 1 contact when filters from 2' do
      input = StringIO.new("E")
      contacts = [{:first_name => "Emma", 
                 :last_name => "Jones", 
                 :dob => "12.08.1997", 
                 :address => "11 Emerald Road", 
                 :postcode => "EC1Y SXY"},
                {:first_name => "Sam", 
                 :last_name => "Smith", 
                 :dob => "01.11.1976", 
                 :address => "03 Hatton Garden", 
                 :postcode => "EC1R 6JP"}]
    filtered_contacts = SearchScreen.new(contacts,input,output).show
     expect(output.string).to include("Emma") 
    end

    xit 'returns 2 filtered contacts from a list of 4' do 
      input = StringIO.new("A")
   filtered_contacts = SearchScreen.new(contacts,input,output).show 
    expect(output.string).to include("Anna")
    expect(output.string).to include("Annabel")
    end

xit 'returns a full list when the user hits enter' do
  input = StringIO.new(enter_key)
  filtered_contacts = SearchScreen.new(contacts,input,output).show
  expect(output.string).to eq(contacts)
end


    class ContactPersisterDouble
        def load
            ContactsDisplay::DUMMY_CONTACTS
        end
        def save(contacts)
        end
    end
end
