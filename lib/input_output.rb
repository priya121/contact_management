require "dummy_contacts_display"
require "read"
require "view_screen"

class InputOutput
    def initialize(input,output)
        @input = input
        @output = output
    end

    def contacts_list
        screen = ViewScreen.new(@input, @output)
        screen.show
    end

    def data_input_output_view
        #if @input.gets.to_i.is_a?Integer and @input != 0
        screen = ViewScreen.new(@input, @output)
        screen.perform_action
    end 

    def start
        contacts_list
        data_input_output_view
    end
end
