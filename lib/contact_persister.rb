require "json"

class ContactPersister    

    def initialize(db)
        @db = db
    end

    def load
        file = File.new(@db)
        json = file.read
        data = JSON.parse(json, {symbolize_names: true})
        return data
    end

    def save(contacts)
        file = File.open(@db,"w+")
        json = file.write(contacts.to_json)
        file.close
    end
end

