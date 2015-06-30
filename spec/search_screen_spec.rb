require 'dummy_contacts_display'
require 'search_screen'

describe SearchScreen do 
    let(:string) {"A"}
    let(:contacts) {ContactPersisterDouble.new.load}
    let(:output) {StringIO.new("")}

    xit 'searches contacts according to the first letter' do 
        input = StringIO.new("A")
        SearchScreen.new(contacts,input,output).show_filtered_contacts
        expect(output.string).to include("Anna")
    end
    xit 'searches contacts according to two letters' do 
      input = StringIO.new("Anna")
      SearchScreen.new(contacts,input,output).show_filtered_contacts
      expect(output.string).to include("Anna")
    end

    xit 'outputs list of names beginning with A' do 
      input = StringIO.new("A")
      SearchScreen.new(@contacts,input,output).show
      expect(output.string).to include("Annabel")

    end
    class ContactPersisterDouble
        def load
            ContactsDisplay::DUMMY_CONTACTS
        end
        def save(contacts)
        end
    end
end
