require "dummy_contacts_display"
require "contact_persister"
require "view_screen"
require "create_screen"
require "delete_screen"
require "update_screen"

class MenuChooser
    def initialize(contact_persister,input,output,screens = [CreateScreen,ViewScreen,UpdateScreen,DeleteScreen]) @contact_persister = contact_persister
        @input = input
        @output = output
        @screens = screens
    end

    def show
        show_screen_titles
        @choice = @input.gets.to_i - 1
        loaded_contacts = ContactPersister.new('/Users/priya10487/.con_man/db.rb').load
        screen = @screens[@choice].new(loaded_contacts,@input,@output)
        screen.show
    end

    def save
        loaded_contacts =  ContactPersister.new('/Users/priya10487/.con_man/db.rb').save(@output)
    end

    def start
        show
        @output.puts "Would you like to exit?"
        if @input.gets.chomp == "Y"
            @output.puts "Exiting"
        else 
            start
        end
    end

    private
    def show_screen_titles
        @output.puts "What would you like to do?"
        @screens.each_with_index do |screen_class,i|
            screen = screen_class.new(@contacts ,@input, @output)
            @output.puts "#{i+1}) " + screen.title
        end
        @output.puts "\nEnter your choice:"
    end
end
