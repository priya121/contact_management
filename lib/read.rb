require "dummy_contacts_display"

class Read
    def initialize(contacts,input)
        @contacts = contacts
        @input = input
    end

    def fetch_contact
        contact_id = @input.to_i
        return @contacts[@input.to_i - 1] 
    end
end
