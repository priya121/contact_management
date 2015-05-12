class FindContact

    def initialize(input)
        @input = input
        #@output = output
    end

    def dummy_contacts
        $contacts = [{:name => "Anna Smith",
            :dob => "10.03.1989", 
            :address => "12 Forlease Road",
            :postcode => "SW9 0LG"},

            {:name => "Bob Smith", 
                :DOB  => "02.12.1988",
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
    def fetch_contact
        contact_id = @input
        if contact_id.is_a?Integer 
            return "#{dummy_contacts[contact_id -1]}"
        else 
            return "main page"
        end
    end

end

class Create 
    def initialize(first_name,last_name,dob)
       @first_name = first_name
       @last_name = last_name
       @dob = dob
    end

    def add_contact
        $contacts << {:name => "#{@first_name} #{@last_name}",:dob => "#{@dob}"}

end
end


class InputOutput

    def initialize(input,output)
        @input = input
        @output = output
    end

    def data_input_output
     result = FindContact.new(@input.gets.to_i).fetch_contact
     @output.puts "#{result}"

    end
end


















