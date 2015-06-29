class ContactSearcher
  def initialize(contacts)
    @contacts = contacts
  end

  def filtered_array(string)
    filtered_contacts = []
    @contacts.map do |contact|
     if string.to_s.length == 1 && contact[:first_name].start_with?(string.to_s)
        filtered_contacts << contact
     elsif string.length >= 2 && contact[:first_name][0..string.length - 1] == string.to_s[0..string.length - 1]
        filtered_contacts << contact
      end
    end
      filtered_contacts 
  end
end
