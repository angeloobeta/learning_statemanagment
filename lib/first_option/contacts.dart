import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Contact {
  String id;
  String name;
  int phoneNumber;
  String email;

  Contact({required this.name, required this.phoneNumber, required this.email})
      : id = const Uuid().v4();

  @override
  String toString() {
    return 'Name: $name, Phone Number: $phoneNumber, Email: $email';
  }
}
