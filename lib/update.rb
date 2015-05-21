require "dummy_contacts_display"

class Update
    def initialize(contacts,first_name,last_name,id_number)
        @contacts = contacts
        @first_name = first_name
        @last_name = last_name
        @id_number = id_number
    end
    def update
        new_values = {:first_name => "#{@first_name}", :last_name => "#{@last_name}"}
        return Read.new(@contacts,@id_number).fetch_contact.merge!(new_values){|key,v1,v2|v2}
    end
end
