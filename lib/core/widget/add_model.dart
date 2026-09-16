import 'package:contacts_app/core/utils/animations/animation.dart';
import 'package:contacts_app/core/utils/color/color.dart';
import 'package:contacts_app/core/utils/style/app_style.dart';
import 'package:contacts_app/core/utils/vaildator/validator.dart';
import 'package:contacts_app/core/widget/image.dart';
import 'package:flutter/material.dart';
import 'package:contacts_app/model/contact.dart';
import 'dart:io';

import 'package:lottie/lottie.dart';

class AddContactSheet extends StatefulWidget {
  AddContactSheet({required this.onContantAdd,required this.contacts,super.key});
  final List<Contact> contacts;
  final VoidCallback onContantAdd;
  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  File? image;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ColorApp.darkBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 5,
            children: [
              Row(
                spacing: 5,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorApp.white),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      height: hight * 0.16,
                      child: image == null
                          ? Center(
                              child: GestureDetector(
                                onTap: () async {
                                  image = await ImagePickerUtils.cameraPicker();
                                  setState(() {});
                                },
                                child: Lottie.asset(AnimationApp.imagePicker),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(28),
                              child: Image.file(image!, fit: BoxFit.cover),
                            ),
                    ),
                  ),

                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: nameCtrl,
                          builder: (context, value, child) {
                            return Text(
                              value.text.isEmpty ? 'user name' : value.text,
                              style: AppStyles.font16WhiteMudium,
                            );
                          },
                        ),

                        Divider(color: ColorApp.white),

                        ValueListenableBuilder(
                          valueListenable: emailCtrl,
                          builder: (context, value, child) {
                            return Text(
                              value.text.isEmpty ? 'user email' : value.text,
                              style: AppStyles.font16WhiteMudium,
                            );
                          },
                        ),
                        Divider(color: ColorApp.white),
                        ValueListenableBuilder(
                          valueListenable: phoneCtrl,
                          builder: (context, value, child) {
                            return Text(
                              value.text.isEmpty ? 'user phone' : value.text,
                              style: AppStyles.font16WhiteMudium,
                            );
                          },
                        ),
                        Divider(color: ColorApp.white),
                      ],
                    ),
                  ),
                ],
              ),

              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: ColorApp.darkBlue,
                      width: 1,
                    ),
                  ),

                  hint: Text("Enter your name", style: AppStyles.hintTextStyle),
                ),

                controller: nameCtrl,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter a value';
                  }

                  return null;
                },
              ),

              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: ColorApp.darkBlue,
                      width: 1,
                    ),
                  ),
                  hint: Text(
                    "Enter your email",
                    style: AppStyles.hintTextStyle,
                  ),
                ),

                controller: emailCtrl,

                validator: (value) {
                  return Validation.emailValidation(value);
                },
              ),

              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: ColorApp.darkBlue,
                      width: 1,
                    ),
                  ),
                  hint: Text(
                    "Enter your phone",
                    style: AppStyles.hintTextStyle,
                  ),
                ),

                controller: phoneCtrl,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter a value';
                  }

                  return null;
                },
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorApp.gold,
                  // maximumSize: Size.infinite,
                  // fixedSize: Size.infinite,
                ),
                onPressed: () {
                  addContact();
                },
                child: Text(
                  "Enter User",
                  style: AppStyles.elevatedButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addContact() {
    if (formKey.currentState!.validate()) {
      widget.contacts.add(
        Contact(
          name: nameCtrl.text,
          phoneNumber: phoneCtrl.text,
          email: emailCtrl.text,
        ),
      );
      widget.onContantAdd;
      Navigator.pop(context);
    }
  }
}
