require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

class ContactList

  def help
    puts "Here is a list of available commands"
    puts "    new  - Create a new contact"
    puts "    list - List all contacts"
    puts "    show - Show a contact"
    puts "    find - Find a contact"
  end

  def new
    print "What is the name of the person you are trying to add? "
    name = gets.chomp.capitalize
    print "What is this person's email? "
    email = gets.chomp
    new_contact = Contact.create(name, email)
    ContactsDatabase.write_contacts(new_contact.name, new_contact.email)
  end

  def list
    ContactsDatabase
    puts "#{row[0]}: #{row[1]} (#{row[2]})"
    end
    puts "----------"
    puts "#{contact_list.length} records total"
  end

end