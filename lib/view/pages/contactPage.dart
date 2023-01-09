import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learning_statemanagment/model/models/contacts/contact.dart';
import 'package:learning_statemanagment/viewModel/ContactViewModel/contactViewModel.dart';
import 'package:stacked/stacked.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactViewModel>.reactive(
        viewModelBuilder: () => ContactViewModel(),
        builder: (context, model, child) => Scaffold(
              body: ListView.builder(
                  itemCount: model.contactLength <= 0 ? 0 : model.contactLength,
                  itemBuilder: (context, index) => ListTile(
                        title: Text("${model.getContactIndex(atIndex: index)}"),
                      )),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  model.addContact(
                      contact: Contact(
                          name: 'ifeanYichukwu',
                          phoneNumber: 08118647272,
                          email: 'betabi@gmail.com'));
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ));
  }
}
