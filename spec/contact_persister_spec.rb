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
            save_to_db(file)
            persister = ContactPersister.new(file.path) 
            list = ContactsDisplay::DUMMY_CONTACTS
            saved_file = persister.save(list)
            contacts = persister.load
            expect(contacts).to eq(ContactsDisplay::DUMMY_CONTACTS)
        end
    end 

    def save_to_db(file)
        file.path
        file.open
        json = (ContactsDisplay::DUMMY_CONTACTS).to_json
        file.write(json)
        file.rewind
        return file.path
    end

    def create_db(file)
        json = ContactsDisplay::DUMMY_CONTACTS.to_json
        file.write(json)
        file.close
        return file.path
    end
end

