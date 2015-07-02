require 'search_screen'

class ContactSearcher 
  def initialize(contacts)
    @contacts = contacts
  end

  def filter(string)
    if string == ""
      return  @contacts 
    else
      filtered_contacts = []
      @contacts.map do |contact|
        if contact[:first_name].start_with?(string.to_s)
          filtered_contacts << contact
        end
      end
      filtered_contacts 
    end
  end
end
