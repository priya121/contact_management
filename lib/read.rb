class Read
    def initialize(input)
        @input = input
    end
    def fetch_contact
        contact_id = @input.to_i
        return ContactsDisplay::DUMMY_CONTACTS[contact_id-1] 
    end
end
