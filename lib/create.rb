class Create 
    def initialize(first_name,last_name,dob,address,postcode)
        @first_name = first_name
        @last_name = last_name
        @dob = dob
        @address = address
        @postcode = postcode
    end

    def add_contact
        ContactsDisplay::DUMMY_CONTACTS << {:first_name => "#{@first_name}", :last_name => "#{@last_name}",:dob => "#{@dob}", :address => "#{@address}", :postcode => "#{@postcode}"}
    end
end
