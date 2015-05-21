require "dummy_contacts"
require "input_output"

class ContactChooser
    def initilaize(contacts,input,output)
        @contacts = contacts
        @input = input
        @output = output
    end

    def user_chooses_contact
        contact_list = ContactsDisplay::DUMMY_CONTACTS
        
    end

end
