module ContactsDisplay
    DUMMY_CONTACTS= [{:first_name => "Anna", 
        :last_name => "Smith",
        :dob => "10.03.1989", 
        :address => "12 Forlease Road",
        :postcode => "SW9 0LG"},

        {:first_name => "Bob", 
            :last_name => "Smith",
            :dob => "02.12.1988",
            :address => "10 Cedars Road",
            :postcode => "KT11 1RY"},

            {:first_name => "Emma", :last_name => "Jones",
                :dob => "12.08.1997",
                :address => "11 Emerald Road",
                :postcode => "EC1Y SXY"},

                {:first_name => "Sam", 
                    :last_name => "Smith",
                    :dob => "01.11.1976", 
                    :address => "03 Hatton Garden", 
                    :postcode => "EC1R 6JP"}] 
end

class Read
    def initialize(input)
        @input = input
    end
    def fetch_contact
        contact_id = @input
        return ContactsDisplay::DUMMY_CONTACTS[contact_id-1] 
    end
end

class Create 
    def initialize(first_name,last_name,dob,address,postcode)
        @first_name = first_name
        @last_name = last_name
        @dob = dob
        @address = address
        @postcode = postcode
    end
    def add_contact
        ContactsDisplay::DUMMY_CONTACTS << {:name => "#{@first_name} #{@last_name}",:dob => "#{@dob}", :address => "#{@address}", :postcode => "#{@postcode}"}
    end
end

class Update
    def initialize(first_and_last_name, input)
        @input = input
        @first_and_last_name = first_and_last_name
    end
    def update
        new_values = {:name => "#{@first_and_last_name}"}
        return Read.new(@input).fetch_contact.merge!(new_values){|key,v1,v2|v2}
    end
end

class Delete
    def initialize(id,input)
        @id = id
        @input = input
    end
    def remove_contact
        if @input == "Y"
            contact_hash = Read.new(@id).fetch_contact
            contact_hash.each do |key,value|
                contact_hash.delete(key)
                contact_hash.delete(value)
            end
        else
            @input == "N"
            return ContactsDisplay::DUMMY_CONTACTS
        end
    end
end

class InputOutput
    def initialize(input,output)
        @input = input
        @output = output
    end

    def contacts_list
        @output.puts "View a contact:\nWhich contact would you like to view?"
        ContactsDisplay::DUMMY_CONTACTS.each do |key|
            @output.puts "#{key[:first_name]} #{key[:last_name]}"
        end 
    end

    def data_input_output_view
        #if @input.gets.to_i.is_a?Integer and @input != 0
            @output.puts  Read.new(@input.gets.to_i).fetch_contact
        else   
            @output.puts "main page"
        end 
    end










