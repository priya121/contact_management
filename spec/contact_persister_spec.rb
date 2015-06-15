require "json"
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

    describe "#load" do
        it "loads all data" do
            create_db(file)
            expect(persister.load).to eq(contacts)
        end

        it 'raises an exception if loading an empty file' do
            expect {persister.load}.to raise_error(ContactLoadError)
        end
    end

    describe "#save" do
        it "saves data" do
            persister.save(contacts)
            loaded_contacts = persister.load
            expect(loaded_contacts).to eq(contacts)
        end
    end 
end
