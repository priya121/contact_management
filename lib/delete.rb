class Delete
    def initialize(id)
        @id = id
    end
    def remove_contact
        contact_hash.each do |key,value|
            contact_hash.delete(key)
            contact_hash.delete(value)
        end
        return contact_hash
    end
end
