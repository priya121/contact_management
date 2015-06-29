require "contact_chooser"
require "dummy_contacts_display"
require "update"

class UpdateScreen
  def initialize(contacts,input, output)
    @contacts = contacts
    @input = input
    @output = output
  end

  def title
    "Update a contact"
  end

  def show 
    @output.puts "Choose a contact to Update:"
    list = ContactChooser.new(@contacts,@input,@output).show_contacts_list
    @chosen_id = @input.gets.to_i - 1
    @output.puts "Enter the details of any changes you would like to make:"
    update_contact
  end

  def first_name
    old_first_name = @contacts[@chosen_id][:first_name]
    @output.puts "Current First Name: #{old_first_name}"
    @output.puts "New First Name (leave blank to keep):"
    first_name = @input.gets || 
      if @input.gets == "" 
        first_name = old_first_name 
      end
  end 

  def last_name
    old_last_name = @contacts[@chosen_id.to_i][:last_name]
    @output.puts "Current Last Name: #{old_last_name}"
    @output.puts "New Last Name (leave blank to keep):"
    last_name = @input.gets || 
      if @input.gets == "" 
        last_name = old_last_name
      end
  end

  def dob
    old_dob = @contacts[@chosen_id.to_i][:dob]
    @output.puts "New d.o.b: (leave blank to keep):"
    dob = @input.gets ||
      if @input.gets == ""
        dob = old_dob
      end
  end

  def address
    old_address = @contacts[@chosen_id.to_i][:address]
    @output.puts "New Address (leave blank to keep):"
    address = @input.gets ||
      if @input.gets == ""
        address = old_address
      end
  end

  def postcode
    old_postcode = @contacts[@chosen_id.to_i][:postcode]
    @output.puts "New Postcode (leave blank to keep):"
    postcode = @input.gets || 
      if @input.gets == ""
        postcode = old_postcode
      end
  end

  def update_contact
    updated_contact = Update.new(@contacts,first_name,last_name,dob,address,postcode,@chosen_id)
    updated_contacts_list = updated_contact.update
    @output.puts "First Name: #{updated_contacts_list[:first_name]}"
    @output.puts "Last Name: #{updated_contacts_list[:last_name]}"
    @output.puts "d.o.b: #{updated_contacts_list[:dob]}"
    @output.puts "Address: #{updated_contacts_list[:address]}"
    @output.puts "Postcode: #{updated_contacts_list[:postcode]}"
  end
end
