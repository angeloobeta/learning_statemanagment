import 'package:flutter/material.dart';
import 'package:learning_statemanagment/first_option/contactBook.dart';
import 'package:learning_statemanagment/first_option/contacts.dart';

import 'view/pages/contactPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: ContactPage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final contact = ContactBook();

  void _addContact() {
    contact.addContact(
        contact: Contact(
            name: 'ifeanYichukwu',
            phoneNumber: 08118647272,
            email: 'betabi@gmail.com'));
  }

  @override
  Widget build(BuildContext context) {
    final contact = ContactBook();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: ContactBook(),
          builder: (BuildContext context, dynamic value, Widget? child) {
            final contacts = value as List<Contact>;
            return ListView.builder(
              itemCount: contact.contactLenght,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (dismissable) {
                    contact.removeContact(contact: contacts[index]);
                  },
                  child: ListTile(
                    title: Text(
                      '${contact.getContact(atIndex: index)!.name}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addContact();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
