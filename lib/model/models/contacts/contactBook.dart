import 'package:learning_statemanagment/model/models/contacts/contact.dart';

class ContactBook {
  // create singleton for ContactBook
  ContactBook._sharedInstance();
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  // create arraY of contacts
  final List<Contact> _contacts = [];

  //get length of contacts
  int get contactLenght => _contacts.length;

  // add contact
  void addContact({required Contact contact}) {
    _contacts.add(contact);
  }

  // remove contact
  void removeContact({required Contact contact}) {
    _contacts.remove(contact);
  }

  Contact? getContact({required int atIndex}) =>
      _contacts.length > atIndex ? _contacts[atIndex] : null;
}
