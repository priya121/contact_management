require "json"
require "contact_load_error"

class ContactPersister    

    def initialize(file_path)
        @file_path = file_path
    end

    def load_json
        JSON.parse(load, {symbolize_names: true})
    rescue JSON::ParserError 
        raise ContactLoadError
    end

    def save(contacts)
        file = File.open(@file_path,"w+")
        file.write(contacts.to_json)
        file.close
    end

    private

    def load
        File.new(@file_path).read
    end
end

