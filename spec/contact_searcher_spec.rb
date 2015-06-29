require "contact_searcher"
require "dummy_contacts_display"
require "contact_persister"
require "contacts_generator"

describe ContactSearcher do
  let(:contacts) {ContactPersisterDouble.new.load}

  it "filters out names beginning with A" do 
    string = ("A")
    filtered_contacts = ContactSearcher.new(contacts).filtered_array(string)
    expect(filtered_contacts).to eq([{:first_name=>"Anna", :last_name=>"Smith", :dob=>"10.03.1989", :address=>"12 Forlease Road", :postcode=>"SW9 0LG"}, {:first_name => "Annabel", :last_name => "Evans", :dob => "11.12.1999", :address => "01 Rosebury Av", :postcode => "EC12 8CY"}])
  end

  it "filters out names when the user enters the first two characters of the first name" do 
    string = ("Em")
    filtered_contacts = ContactSearcher.new(contacts).filtered_array(string)
    expect(filtered_contacts).to eq([{:first_name => "Emma", :last_name => "Jones", :dob => "12.08.1997", :address => "11 Emerald Road", :postcode => "EC1Y SXY"}])
  end

  class ContactPersisterDouble
    def load
      ContactsDisplay::DUMMY_CONTACTS
    end

    def save(contacts)
    end
  end
end
