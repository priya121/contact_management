class ContactSearcher
  def initialize(contacts,input,output)
    @contacts = contacts
    @input = input
    @output = output
  end

  def filtered_array(input)
    filtered_contacts = []
    @contacts.select {|contact| if contact[:first_name].start_with?(input.to_s)
      filtered_contacts << contact
  end}
  filtered_contacts
end
end
