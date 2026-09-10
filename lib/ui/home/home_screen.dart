import 'package:contacts_app/core/widget/add_model.dart';
import 'package:contacts_app/core/widget/custom_flot.dart';
import 'package:flutter/material.dart';
import 'package:contacts_app/core/utils/color/color.dart';
import 'package:contacts_app/core/utils/image/image.dart';
import 'package:contacts_app/model/contact.dart';
import 'package:contacts_app/core/widget/place.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [
    Contact(name: "Fatma", phoneNumber: "01221993579", email: "Fatma@gmail.com")
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorApp.darkBlue,
      appBar: AppBar(
        leadingWidth: width * .3,
        backgroundColor: ColorApp.darkBlue,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: const Image(image: AssetImage(ImageApp.profile)),
        ),
      ),
      body: contacts.isEmpty
          ? const PlaceWidget()
          : GridView.builder(
            itemCount: contacts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),

              itemBuilder: (context, index) {
                return Text(contacts[index].name);
              },
            ),
      floatingActionButton: CustomFloat(
        showAddContact: showAdd,
        deleteContact: deletcontact,
      ),
    );
  }

  void showAdd() {
    showModalBottomSheet(
      context: context,

      builder: (context) {
        return AddContactSheet();
      },
    );
  }

  void deletcontact() {
    contacts.removeLast();
    setState(() {});
  }
}
