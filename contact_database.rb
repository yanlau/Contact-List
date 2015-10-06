## TODO: Implement CSV reading/writing
require 'csv'

class ContactsDatabase

  class << self

    def write_contacts(name, email)
      id_gen = CSV.read("./contacts.csv").length + 1
      CSV.open("./contacts.csv", "a") do |csv|
        csv << [id_gen, name, email]
      end
    end

    def list_contacts
      contact_list = []
      CSV.foreach("./contacts.csv") do |row|
        contact_list << row
      end
      contact_list
    end

    def show

    end

  end

end

require 'pry'
binding.pry