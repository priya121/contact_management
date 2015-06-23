require 'dummy_contacts_display'
require 'search_screen'
require 'contact_searcher'

describe SearchScreen do 
    let(:string) {"A"}
    let(:contacts) {ContactPersisterDouble.new.load}
    let(:input) {StringIO.new("A")}
    let(:output) {StringIO.new("")}
    it 'searches contacts according to the first letter' do 
        SearchScreen.new(contacts,input,output).show_filtered_contacts
        expect(output.string).to include("Anna")
    end

    class ContactPersisterDouble
        def load
            ContactsDisplay::DUMMY_CONTACTS
        end

        def save(contacts)
        end
    end
end
