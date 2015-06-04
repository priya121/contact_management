require "json"

class ContactPersister    
    
   def initialize(db)
       @db = db
   end

    def load
        file = File.new(@db)
        json = file.read
        return JSON.parse(json,{:symbolize_names => true})
    end

    def save(contacts)
        file = File.open(@db,"w+")
        json = file.write(contacts.to_json)
        file.close
    end
end
