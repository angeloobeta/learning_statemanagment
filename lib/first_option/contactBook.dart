import 'package:flutter/material.dart';
import 'package:learning_statemanagment/first_option/contacts.dart';

class ContactBook extends ValueNotifier<List<Contact>> {
  // create singleton for ContactBook
  ContactBook._sharedInstance() : super([]);
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

// create arraY of contacts
  final List<Contact> _contacts = [];

  //get length of contacts
  int get contactLenght => value.length;

  // add contact
  void addContact({required Contact contact}) {
    final contacts = value;
    contacts.add(contact);
    notifyListeners();
    // _contacts.add(contact);
  }

  // remove contact
  void removeContact({required Contact contact}) {
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();
    }

    _contacts.remove(contact);
  }

  Contact? getContact({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}
