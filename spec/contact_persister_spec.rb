require "json"
require "contact_persister"
require "dummy_contacts_display"
require "tempfile"

describe ContactPersister do

    describe "#load" do
        it "loads all data" do
            file = Tempfile.new('db')
            create_db(file)
            persister = ContactPersister.new(file.path)
            contacts = persister.load
            expect(contacts).to eq(ContactsDisplay::DUMMY_CONTACTS)
        end
    end

    describe "#save" do
        it "saves data" do
            file = Tempfile.new('db')
            persister = ContactPersister.new(file.path) 
            saved_contacts = ContactsDisplay::DUMMY_CONTACTS
            saved_file = persister.save(saved_contacts)
            loaded_contacts = persister.load
            expect(loaded_contacts).to eq(saved_contacts)
        end
    end 

    def create_db(file)
        json = ContactsDisplay::DUMMY_CONTACTS.to_json
        file.write(json)
        file.close 
        return file.path
    end
end
