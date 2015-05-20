require "dummy_contacts_display"
require "view_screen"
require "create_screen"
require "delete_screen"
require "update_screen"


# class MenuChooser
class InputOutput
    def initialize(input,output,screens = [CreateScreen,ViewScreen,UpdateScreen,DeleteScreen])
        @input = input
        @output = output
        @screens = screens
    end

    def show
        show_screen_titles
        @choice = @input.gets.to_i - 1
        screen = @screens[@choice].new(@input, @output)
        screen.show
    end

    #def perform_action 
        #@screen = @screens[@choice].new(@input,@output)
        #@screen.perform_action
    #end 

    def start
        show
        @output.puts "Would you like to exit?"
        if @input.gets.chomp == "Y"
            @output.puts "Exiting game"
        else 
            return true
    end
    end

    private

    def show_screen_titles
        @output.puts "What would you like to do?\n"
        @screens.each_with_index do |screen_class,i|
            screen = screen_class.new(@input, @output)
            @output.puts "#{i+1}) " + screen.title
        end
        @output.puts "\nEnter your choice:"

    end


end
