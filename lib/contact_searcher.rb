require 'search_screen'

class ContactSearcher 
  def initialize(contacts)
    @contacts = contacts
  end

  def filter(string)
    if string == ""
      @contacts 
    else
      @contacts.select do |contact|
        contact[:first_name].start_with?(string)
      end
    end
  end
end
