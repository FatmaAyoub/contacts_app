import 'dart:io';
class Contact {
   String name;
   String phoneNumber;
   String email;

   File? image;
  Contact({
    required this.name,
    required this.phoneNumber,
    required this.email,
    this.image,

  });

}