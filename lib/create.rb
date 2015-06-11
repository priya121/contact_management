class Create 
    def initialize(contacts,first_name,last_name,dob,address,postcode)
        @contacts = contacts
        @first_name = first_name
        @last_name = last_name
        @dob = dob
        @address = address
        @postcode = postcode
    end

    def add_contact
        @contacts << {:first_name => "#{@first_name}", :last_name => "#{@last_name}",:dob => "#{@dob}", :address => "#{@address}", :postcode => "#{@postcode}"}
    end
end
