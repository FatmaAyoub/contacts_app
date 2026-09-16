import 'package:contacts_app/core/widget/add_model.dart';
import 'package:contacts_app/core/widget/card.dart';
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
  List<Contact> contacts = [];

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
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: contacts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.57,
                ),

                itemBuilder: (context, index) {
                  return ContactCard(
                    contactModel: contacts[index],
                    deleteContact: () {
                      deletIndex(index);
                    },
                  );
                },
              ),
            ),
      floatingActionButton: CustomFloat(
        showAddContact: showAdd,
        deleteContact: deletcontact,
        isAdd: contacts.length < 6,
        isDelete: contacts.isNotEmpty,
      ),
    );
  }

  void showAdd() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,

      builder: (context) {
        return AddContactSheet(
          contacts: contacts,
          onContantAdd: () {
            setState(() {});
          },
        );
      },
    );
  }

  void deletcontact() {
    contacts.removeLast();
    setState(() {});
  }

  void deletIndex(int index) {
    contacts.removeAt(index);
    setState(() {});
  }
}
