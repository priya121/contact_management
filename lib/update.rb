
class Update
    def initialize(first_name,last_name,input)
        @input = input
        @first_name = first_name
        @last_name = last_name
    end
    def update
        new_values = {:first_name => "#{@first_name}", :last_name => "#{@last_name}"}
        return Read.new(@input).fetch_contact.merge!(new_values){|key,v1,v2|v2}
    end
end
