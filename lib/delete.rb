class Delete
    def initialize(contact_hash,id)
        @contact_hash = contact_hash 
        @id = id
    end

    def remove_contact
         @contact_hash.delete_at(@id-1)
    end
end
