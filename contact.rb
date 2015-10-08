require_relative 'contact_database'
require 'pry'

class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end
 
  def to_s
    # TODO: return string representation of Contact
    puts 
  end
 
  ## Class Methods
  class << self

    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      id_gen = ContactsDatabase.current_id + 1
      new_contact = Contact.new(name, email)
      ContactsDatabase.write_contact(id_gen, new_contact.name, new_contact.email)
    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      contact_list = Contact.all
      regex_term = /#{term}/i
      term = term.downcase
      found_contacts = []
      contact_list.each do |contacts_array|
        if contacts_array.any?{|contact| contact[regex_term]}
          found_contacts << contacts_array
        end
      end
      binding.pry
      found_contacts

    end
 
    def all
      # TODO: Return the list of contacts, as is
      ContactsDatabase.list
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      contact_list = ContactsDatabase.list
      contact_list[id-1]
    end
    
  end
 
end

Contact.find('dar')
