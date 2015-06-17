require 'random_data'

def generator 
    {:first_name => Random.firstname, :last_name => Random.lastname, :dob => Random.date.to_s, :address => Random.address_line_1, :postcode => Random.uk_post_code}
end

def list_generator(size)
    array = []
    size.times do  
         array << generator
    end
    array
end

