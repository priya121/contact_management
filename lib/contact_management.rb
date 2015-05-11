class FindContact

    def initialize(input)
        @input = input
        #@output = output
    end

    def dummy_contacts
        @contacts = [{:name => "Anna Smith",
            :dob => "10.03.1989", 
            :address => "12 Forlease Road",
            :postcode => "SW9 0LG"},

            {:name => "Bob Smith", 
                :dob  => "02.12.1988",
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
        contact_key = @input
        if contact_key.is_a?Integer
            return "#{dummy_contacts[contact_key -1]}"
        else 
            return "main page"
        end
    end

end



class InputOutput
    def initilaize(input,output)
        @input = input
        @output = output
    end

    def data_input_output
        result = FindContact.new(@input.gets).fetch_data
        puts result
    end
end


















