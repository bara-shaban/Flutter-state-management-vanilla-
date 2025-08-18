import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class ContactBook{
  ContactBook._SharedInstance();

  static final ContactBook _shared = ContactBook._SharedInstance();

  factory ContactBook()=> _shared;
  
  final List<Contact> _contacts = [];

  int get length => _contacts.length;

  void addContact(Contact contact) {
    _contacts.add(contact);
  }

  void removeContact(Contact contact) {
    _contacts.remove(contact);
  }

  Contact? contact({required int atIndex}) => _contacts.length > atIndex ? _contacts[atIndex] : null;

}


class Contact {
  final String name;

  const Contact({required this.name,});
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final contactBook = ContactBook();
    return Scaffold(
      body:ListView.builder(
        itemCount: contactBook.length,itemBuilder: (context, index) {
          final contact =contactBook.contact(atIndex: index)!;
          return const ListTile(
            title: ListTile(
              title: Text('Contact Name'),
            ),
          );
        },)
    );
  }
}