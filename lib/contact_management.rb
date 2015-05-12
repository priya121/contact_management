class ContactsDisplay
    def dummy_contacts
         $contacts = [{:name => "Anna Smith",
            :dob => "10.03.1989", 
            :address => "12 Forlease Road",
            :postcode => "SW9 0LG"},

            {:name => "Bob Smith", 
                :dob => "02.12.1988",
                :address => "10 Cedars Road",
                :postcode => "KT11 1RY"},

                {:name => "Emma Jones",
                    :dob => "12.08.1997",
                    :address => "11 Emerald Road",
                    :postcode => "EC1Y SXY"},

                    {:name => "Sam Smith",
                        :dob => "01.11.1976",
                        :address => "03 Hatton Garden",
                        :postcode => "EC1R 6JP"}] 
    end
end

class Read
    def initialize(input)
        @input = input
    end
    def fetch_contact
        contact_id = @input
        if contact_id.is_a?Integer and contact_id != 0
            $selected_contact =  ContactsDisplay.new.dummy_contacts[contact_id -1]
            return $selected_contact
        else 
            return "main page"
        end
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
        $contacts << {:name => "#{@first_name} #{@last_name}",:dob => "#{@dob}", :address => "#{@address}", :postcode => "#{@postcode}"}
    end
end

class Update
    def initialize(first_and_last_name)
        @first_and_last_name = first_and_last_name
    end
   def update
   new_values = {:name => "#{@first_and_last_name}"}
       return $selected_contact.merge!(new_values){|key,v1,v2|v2}
       
   end
   end

class InputOutput
    def initialize(input,output)
        @input = input
        @output = output
    end
    
    def contacts_list
        @output.puts "View a contact:\nWhich contact would you like to view?"
        @output.puts ContactsDisplay.new.dummy_contacts
    end

    def data_input_output_view
        result = Read.new(@input.gets.to_i).fetch_contact
        @output.puts "#{result}"
    end
end










