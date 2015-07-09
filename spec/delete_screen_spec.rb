require "delete_screen"
require "delete"
require "contact_persister"

describe DeleteScreen do 
  let(:output) {StringIO.new("")}
  let(:loaded_file) {ContactPersisterDouble.new.load}
  let(:delete) {DeleteScreen.new(loaded_file,@input,output).show}

  it "Asks the user to select a contact to delete as soon as they go to the delete screen" do 
    @input = StringIO.new("A\n1\nN")
    delete
    expect(output.string).to include("Select a contact to delete:")
  end

  it "Displays - contact successfully deleted when a user deletes a contact" do  
    @input = StringIO.new("\n3\nY\nY")
    delete
    expect(output.string).to include("Contact successfully deleted")
  end

  it "updates the dummy hash so that it no longer contains the deleted contact" do
    @input = StringIO.new("Annab\n1\nY\nY\n")
    delete
    expect(output.string).to include("Annabel")
  end

  it "returns a full display of contacts if the user enters N" do 
    @input = StringIO.new("An\n1\nN\n")
    delete
    expect(output.string).to include("Anna")
    expect(output.string).to include("Sam")
  end
end

class ContactPersisterDouble

  def load
    ContactsDisplay::DUMMY_CONTACTS
  end

  def save(contacts)
  end

end
