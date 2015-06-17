require 'contacts_generator'

describe 'random_data_generator' do 
    it 'generates random data' do
        expect(generator.keys).to match_array([:first_name,:last_name,:dob,:address,:postcode])
        expect(list_generator(10).size).to eq(10)
    end
end
