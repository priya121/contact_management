require "dummy_contacts_display"
require "view_screen"
require "create_screen"
require "delete_screen"
require "update_screen"


# class MenuChooser
class InputOutput
    def initialize(input,output,screens = [CreateScreen,ViewScreen,CreateScreen])
        @input = input
        @output = output
        @screens = screens
    end

    def show
        screen = @screens[0].new(@input, @output)
        @output.puts "1) " + screen.title
        choice = @input.gets.to_i - 1
        screen = @screens[choice].new(@input, @output)
        screen.show
    end

    def data_input_output_view
        screen = @screens[0].new(@input, @output)
        screen.perform_action
    end 

    def start
        show
        data_input_output_view
    end
end
