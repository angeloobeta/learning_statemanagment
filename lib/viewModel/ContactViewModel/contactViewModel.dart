import 'package:learning_statemanagment/model/models/contacts/contact.dart';
import 'package:learning_statemanagment/viewModel/baseModel.dart';

class ContactViewModel extends BaseModel {
  final List<Contact> _contacts = [];

  // get contacts
  int get contactLength => _contacts.length;

  // add contact
  void addContact({required Contact contact}) {
    _contacts.add(contact);
    print("Called add contact method");
    notifyListeners();
  }

  // remove contact
  void removeContact({required Contact contact}) {
    _contacts.remove(contact);
    notifyListeners();
  }

  Contact? getContactIndex({required int atIndex}) =>
      _contacts.length > atIndex ? _contacts[atIndex] : null;
}
