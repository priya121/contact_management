require "dummy_contacts_display"

    describe ContactsDisplay do 
        describe "#DUMMY_CONTACTS" do 
            it "shows all the contact details as soon as the page is loaded" do
                display_contacts = ContactsDisplay::DUMMY_CONTACTS
                expect(display_contacts).to start_with({:first_name=>"Anna", :last_name=>"Smith", :dob=>"10.03.1989", :address=>"12 Forlease Road", :postcode=>"SW9 0LG"})
            end
        end
    end
