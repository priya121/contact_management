require 'filter_subscreen'

class ContactSearcher 
  def initialize(contacts)
    @contacts = contacts
  end

  def filter(string)
    filter_empty_string(string)
      @contacts.select do |contact|
         contact[:first_name].start_with?(string.to_s)
        end
  end

  def filter_empty_string(string)
    if string == ""
      @contacts 
    end
  end
end
