class ContactSearcher
    def initialize(contacts)
        @contacts = contacts
    end

    def filtered_array(string)
        filter(string).compact
    end

    def filter(string)
        @contacts.map do |contact|
            if contact[:first_name].start_with?(string)
                contact
            end
        end
    end
end
