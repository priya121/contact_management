
class Delete
    def initialize(id,input)
        @id = id
        @input = input
    end
    def remove_contact
            contact_hash = Read.new(@id).fetch_contact
            contact_hash.each do |key,value|
                contact_hash.delete(key)
                contact_hash.delete(value)
            end
        if @input == "Y"
            return contact_hash
        else
            @input == "N"
            return ContactsDisplay::DUMMY_CONTACTS
        end
    end
end
