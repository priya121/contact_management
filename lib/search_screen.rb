require 'contact_searcher'

class SearchScreen 
  ENTER = 13.chr
    def initialize(contacts,input,output)
        @contacts = contacts
        @input = input
        @output = output
    end

    def title 
      "Search" 
    end

    def show
      @output.print "There are no contacts." 
      display_contact_list(@contacts)
      c = get_char
      found_contact = @contacts[c.to_i - 1]
      @output.print "#{found_contact}"
    end

  private 
  def display_contact_list(contacts_list)
    @contacts.each_with_index do |contact,i|
      choice = (i + 1).to_s
      @output.print choice + ") " + name(contact)
    end
  end

  def name(contact)
    contact[:first_name] + " " + contact[:last_name]
  end

  def get_char
    begin 
      system("stty raw -echo")
      str = @input.getc
    ensure
      system("stty -raw echo")
    end
    str.chr
  end
end
