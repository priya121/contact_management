require 'contact_searcher'

class FilterSubscreen 
  ENTER = 13.chr
  def initialize(contacts,input,output)
    @contacts = contacts
    @input = input
    @output = output
  end

  def title 
    "Search for a contact" 
  end

  def show
    if @contacts.length > 0
      filter_loop
    else 
      @output.print "There are no contacts."
    end
  end

  private 

  def filter_loop
    @filter = ""
    @character = ""
    @output.puts "Enter a letter to filter or hit enter to select a contact:"
    while @character != ENTER
      @filter += @character
      @result = filter_by_character
      show_found_contacts_list
      @character = get_char
    end
    @output.puts "Enter key hit, select a contact by number."
    contact_number_selected
    @filtered
  end

  def contact_number_selected 
        selected_contact_number = @input.gets.to_i
        display_selected(filter_by_number(selected_contact_number))
       @filtered = filter_by_number(selected_contact_number) 
  end

  def filter_by_character
    @found_contacts = ContactSearcher.new(@contacts).filter(@filter)
  end

  def filter_by_number(number)
     @selected_contact =  @found_contacts[number.to_i- 1]
     @selected_contact
  end

  def display_selected(selected)
    @output.puts "First Name: #{selected[:first_name]}"
    @output.puts "Last Name: #{selected[:last_name]}"
  end

  def show_found_contacts_list
    num = [@found_contacts.length,15].min 
    if num > 1 
      @output.puts "Showing #{num} of 15 contacts."
      @output.puts "Hit enter to select a contact by number."
    end
    display_contact_list(@result)
  end

  def display_contact_list(contacts_list)
    contacts_list[0..14].each_with_index do |contact,i|
      choice = (i + 1).to_s
      @output.puts choice + ") " + name(contact)
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
