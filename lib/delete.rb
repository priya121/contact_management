require "contact_chooser"


class Delete
    def initialize(contacts,input,output)
        @contacts = contacts
        @input = input
        @output = output
    end

    def remove_contact
         @contacts.delete_at(@input)
    end
end
