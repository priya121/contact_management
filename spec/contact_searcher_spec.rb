require "contact_searcher"
require "dummy_contacts_display"
require "contact_persister"
require "contacts_generator"

describe ContactSearcher do
  it 'returns empty list if filtered through empty contacts' do
    contacts = []
    filtered_contacts = ContactSearcher.new(contacts).filter("")
    expect(filtered_contacts).to match_array([])
  end

  it 'if no filter returns all contacts' do
    contacts = [{:first_name => "Emma"}]
    filtered_contacts = ContactSearcher.new(contacts).filter("")
    expect(filtered_contacts).to eq(contacts)
  end

  it 'returns list of 1 if there is a match' do 
    contacts = [{:first_name => "Emma"},
                {:first_name => "Sam"}]
    filtered_contacts = ContactSearcher.new(contacts).filter("E")
    
    expect(filtered_contacts.length).to eq(1)
    expect(filtered_contacts[0][:first_name]).to eq("Emma")
  end

  it 'returns list of all matching contact' do
    filtered_contacts = ContactSearcher.new(load_four_contacts).filter("A")
    expect(filtered_contacts.length).to eq(2)
  end

    def load_four_contacts
      #put four contacts
      ContactsDisplay::DUMMY_CONTACTS
    end

    #new method for filtered_contacts

end
