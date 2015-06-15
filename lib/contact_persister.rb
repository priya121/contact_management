require "json"
require "contact_load_error"

class ContactPersister    

    def initialize(db)
        @db = db
    end

    def load
        JSON.parse(loaded_contacts, {symbolize_names: true})
    rescue JSON::ParserError 
        raise ContactLoadError
    end

    def save(contacts)
        file = File.open(@db,"w+")
        file.write(contacts.to_json)
        file.close
    end

    private

    def loaded_contacts
        File.new(@db).read
    end
end

