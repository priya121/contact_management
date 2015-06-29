require "dummy_contacts_display"
require "read"

class Update
    def initialize(contacts,first_name,last_name,dob, address, postcode,id_number)
        @contacts = contacts
        @first_name = first_name
        @last_name = last_name
        @dob = dob
        @address = address
        @postcode = postcode
        @id_number = id_number
    end

    def update
        new_values = {:first_name => "#{@first_name}", :last_name => "#{@last_name}", :dob => "#{@dob}", :address => "#{@address}", :postcode => "#{@postcode}"}
         Read.new(@contacts,@id_number).fetch_contact.merge!(new_values){|key,v1,v2|v2} 
    end
end
