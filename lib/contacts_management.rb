
class ContactManagement

    def initialize(input,output)
        @input = input
        @output = output
    end


    def read
        contacts = [{:name => "Anna Smith",
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

        contact_key = @input.gets.to_i  
        if contact_key == 1 || 3
        @output.puts "#{contacts[contact_key-1]}"
        else @ouput.puts "main page"
    end
end
end
class DataInputOutput
    def data_input_output

    end
end


















