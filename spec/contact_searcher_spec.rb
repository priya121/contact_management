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
    contacts = [{:first_name => "Emma", 
                 :last_name => "Jones", 
                 :dob => "12.08.1997", 
                 :address => "11 Emerald Road", 
                 :postcode => "EC1Y SXY"}]
    filtered_contacts = ContactSearcher.new(contacts).filter("")
    expect(filtered_contacts).to eq(contacts)
  end

  it 'returns list of 1 if there is a match' do 
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
    filtered_contacts = ContactSearcher.new(contacts).filter("E")
    expect(filtered_contacts.length).to eq(1)
  end

  it 'returns list of all matching contact' do
    filtered_contacts = ContactSearcher.new(load_four_contacts).filter("A")
    expect(filtered_contacts.length).to eq(2)
  end

    def load_four_contacts
      ContactsDisplay::DUMMY_CONTACTS
    end
end
