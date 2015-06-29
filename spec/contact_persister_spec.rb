require "json"
require "contacts_generator"
require "contact_persister"
require "tempfile"

describe ContactPersister do
    let(:contacts)  {{a: 'b'}}
    let(:file)      {Tempfile.new('db')}
    let(:persister) {described_class.new(file.path)}

    def create_db(file)
        file.write(contacts.to_json)
        file.close 
    end

    describe "#load_json" do
        it "loads all data" do
            create_db(file)
            expect(persister.load_json).to eq(contacts)
        end

        it 'raises an exception if loading an empty file' do
            expect {persister.load_json}.to raise_error(ContactLoadError)
        end

        it 'saves 10 contacts to the db3.rb file' do 
            list = list_generator(100)
            persister = ContactPersister.new('/Users/priya10487/.con_man/db3.rb')
            persister.save(list)
            expect(persister.load_json).to eq(list)
            
        end
    end

    describe "#save" do
        it "saves data" do
            persister.save(contacts)
            loaded_contacts = persister.load_json
            expect(loaded_contacts).to eq(contacts)
        end
    end 
end
