require "contact_chooser"
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
    @output.puts "Update a contact."
    subscreen = FilterSubscreen.new(@contacts,@input,@output)
    filtered_contact = subscreen.show
    @result = @contacts.index(filtered_contact)
    @output.puts "Are you sure you want to update the following contact? (Y/N): #{filtered_contact[:first_name]} #{filtered_contact[:last_name]}"
    if @input.gets == "Y\n"
      @output.puts "Enter the details of any changes you would like to make:"
      update_contact
    end
  end

  def first_name
    old_first_name = @contacts[@result][:first_name]
    @output.puts "Current First Name: #{old_first_name}"
    @output.puts "New First Name (leave blank to keep):"
    first_name = @input.gets || 
      if @input.gets == "" 
        first_name = old_first_name 
      end
  end 

  def last_name
    old_last_name = @contacts[@result.to_i][:last_name]
    @output.puts "Current Last Name: #{old_last_name}"
    @output.puts "New Last Name (leave blank to keep):"
    last_name = @input.gets || 
      if @input.gets == "" 
        last_name = old_last_name
      end
  end

  def dob
    old_dob = @contacts[@result.to_i][:dob]
    @output.puts "New d.o.b: (leave blank to keep):"
    dob = @input.gets ||
      if @input.gets == ""
        dob = old_dob
      end
  end

  def address
    old_address = @contacts[@result.to_i][:address]
    @output.puts "New Address (leave blank to keep):"
    address = @input.gets ||
      if @input.gets == ""
        address = old_address
      end
  end

  def postcode
    old_postcode = @contacts[@result.to_i][:postcode]
    @output.puts "New Postcode (leave blank to keep):"
    postcode = @input.gets || 
      if @input.gets == ""
        postcode = old_postcode
      end
  end

  def update_contact
    updated_contact = Update.new(@contacts,first_name,last_name,dob,address,postcode,@result)
    updated_contacts_list = updated_contact.update
    @output.puts "First Name: #{updated_contacts_list[:first_name]}"
    @output.puts "Last Name: #{updated_contacts_list[:last_name]}"
    @output.puts "d.o.b: #{updated_contacts_list[:dob]}"
    @output.puts "Address: #{updated_contacts_list[:address]}"
    @output.puts "Postcode: #{updated_contacts_list[:postcode]}"
  end
end
