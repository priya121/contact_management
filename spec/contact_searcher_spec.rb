require "contact_searcher"
require "dummy_contacts_display"
require "contact_persister"
require "contacts_generator"

describe ContactSearcher do
  let(:contacts) {ContactPersisterDouble.new.load}

  it "filters out names beginning with A" do 
    input  = ("A")
    filtered_contacts = ContactSearcher.new(contacts,input,output).filtered_array(input)
    expect(filtered_contacts.length).to eq(2)
  end


  class ContactPersisterDouble
    def load
      ContactsDisplay::DUMMY_CONTACTS
    end

    def save(contacts)
    end
  end
end
