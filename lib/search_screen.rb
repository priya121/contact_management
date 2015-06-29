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
    filter = ""
    c = ''
    while c != ENTER
    puts "\e[H\e[2J"
    filter = filter + c
    found_contacts = ContactSearcher.new(@contacts).filtered_array(filter)
    show_contacts_list(found_contacts)
    @output.print "Enter a letter to filter, or enter to select: "+ filter
    c = get_char
    end
    @output.print "\nSelect a record: " 
    index = @input.gets.to_i - 1
        @output.puts "First Name: #{found_contacts[index.to_i][:first_name]}"
        @output.puts "Last Name: #{found_contacts[index.to_i][:last_name]}"
        @output.puts "D.O.B (dd.mm/yyyy): #{found_contacts[index.to_i][:dob]}"
        @output.puts "Address: #{found_contacts[index.to_i][:address]}"
        @output.puts "Postcode: #{found_contacts[index.to_i][:postcode]}"
  end

  def show_filtered_contacts
    @output.puts ContactSearcher.new(@contacts).filtered_array(@input)
  end

  private 
    def show_contacts_list(found_contacts)
      total = found_contacts.length
      num = [15,total].min 
      @output.puts "Showing #{num} of #{total} contacts."
        found_contacts.take(num).each_with_index do |key,i|
            @output.puts "#{i+1}) #{key[:first_name]} #{key[:last_name]}"
        end 
    end

    def get_char
      begin
        system("stty raw -echo")
        str = STDIN.getc
      ensure
        system("stty -raw echo")
      end
      str.chr
      end
end
