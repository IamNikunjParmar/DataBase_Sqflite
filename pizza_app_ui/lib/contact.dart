import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Iterable<Contact> _contact = [];

  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  Future<void> requestPermission() async {
    var status = await Permission.contacts.status;
    if (!status.isGranted) {
      if (await Permission.contacts.request().isGranted) {
        _getcontact();
      }
    } else {
      _getcontact();
    }
  }

  Future<void> _getcontact() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contact = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: _contact.isEmpty
          ? const Center(child: Text("No Contacts"))
          : ListView.builder(
              itemCount: _contact.length,
              itemBuilder: (context, index) {
                Contact contact = _contact.elementAt(index);
                return ListTile(
                  leading:
                      (contact.avatar != null && contact.avatar!.isNotEmpty)
                          ? CircleAvatar(
                              backgroundImage: MemoryImage(contact.avatar!),
                            )
                          : CircleAvatar(
                              child: Text(contact.initials()),
                            ),
                  title: Text(contact.displayName ?? 'No Name'),
                  subtitle: Text(contact.phones!.isNotEmpty
                      ? contact.phones!.first.value ?? ''
                      : 'No phone number'),
                );
              },
            ),
    );
  }
}
