class ContactSearcher
  def initialize(contacts)
    @contacts = contacts
  end

  def filtered_array(string)
    filtered_contacts = []
    @contacts.map do |contact|
    if contact[:first_name].start_with?(string.to_s)
        filtered_contacts << contact
      end
    end
      filtered_contacts 
  end
end
