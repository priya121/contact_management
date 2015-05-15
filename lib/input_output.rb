require "dummy_contacts_display"
require "read"
require "view_screen"

# class MenuChooser
class InputOutput
    def initialize(input,output,screens = [ViewScreen])
        @input = input
        @output = output
        @screens = screens
    end

    def contacts_list
        screen = @screens[0].new(@input, @output)
        screen.show
    end

    def data_input_output_view
        screen = @screens[0].new(@input, @output)
        screen.perform_action
    end 

    def start
        contacts_list
        data_input_output_view
    end
end
