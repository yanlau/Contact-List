## TODO: Implement CSV reading/writing
require 'csv'

class ContactsDatabase

  class << self

    def write_contact(id, name, email)
      CSV.open("./contacts.csv", "ab") do |csv|
        csv << [id, name, email]
      end
    end

    def list
      contact_list = []
      CSV.foreach("./contacts.csv") do |row|
        contact_list << row
      end
      contact_list
    end

    def current_id
      CSV.read("./contacts.csv").length
    end

    def delete_contact

    end

  end

end