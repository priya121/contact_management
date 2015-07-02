require 'contact_searcher'

class SearchScreen 
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
    @found_contacts = @contacts
    empty_contacts 
    if @contacts.length > 0
      filter_loop
    end
  end

  private 

  def filter_loop
    @filter = ""
    @character = ""
    while @character != ENTER
      @output.puts "Enter a letter to filter or hit enter to select a contact:"
      @filter += @character
      @result = filter_by_character
      show_found_contacts_list
      @character = get_char
      if @character.to_i > 0 
        display_selected(filter_by_number(@character))
      end
    end
    enter_key_pressed
  end

  def enter_key_pressed
    if get_char == ENTER
      @output.puts "Select a contact or press enter to exit:"
      @output.puts display_selected(filter_by_number(@input.gets.to_i))
    end
  end

  def filter_by_character
    @found_contacts = ContactSearcher.new(@contacts).filter(@filter)
    @found_contacts
  end

  def filter_by_number(number)
    @selected_contact =  @found_contacts[number.to_i- 1]
  end

  def display_selected(selected)
     @output.puts "First Name: #{selected[:first_name]}"
     @output.puts "Last Name: #{selected[:last_name]}"
  end

  def show_found_contacts_list
    total = @contacts.length
    num = [@found_contacts.length,total].min 
    @output.puts "Showing #{num} of #{total} contacts."
    display_contact_list(@result)
  end

  def display_contact_list(contacts_list)
    contacts_list.each_with_index do |contact,i|
      choice = (i + 1).to_s
      @output.puts choice + ") " + name(contact)
    end
  end

  def empty_contacts
    if @contacts.length == 0
      @output.print "There are no contacts."
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
