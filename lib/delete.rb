class Delete
    def initialize(contacts,input,output)
        @contacts = contacts
        @input = input
        @output = output
    end

    def remove_contact
        deleted_contact = ContactChooser.new(@contacts,@input,@output).contact_chosen
         @contacts.delete_at(deleted_contact)
    end
end
