class Read
    def initialize(contacts_hash,input)
        @contacts_hash = contacts_hash
        @input = input
    end

    def fetch_contact
        contact_id = @input.to_i
        return @contacts_hash[contact_id-1] 
    end
end
