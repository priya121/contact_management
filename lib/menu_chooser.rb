require "create_screen"
require "delete_screen"
require "update_screen"
require "view_screen"

class MenuChooser
    def initialize(contacts,contact_persister,input,output,screens = [CreateScreen,ViewScreen,UpdateScreen,DeleteScreen])
        @contacts = contacts
        @contact_persister = contact_persister
        @input = input
        @output = output
        @screens = screens
    end

    def show
        show_screen_titles
        @choice = @input.gets.to_i - 1
        screen = @screens[@choice].new(@contact_persister,@input,@output)
        screen.show
    end

    def start
        @contacts = @contacts.load
        @output.puts "Would you like to exit?"
        if @input.gets.chomp == "Y"
            @output.puts "Exiting"
        else 
            start
        end
        @contacts.persister.save(@contacts)
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
