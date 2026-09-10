import 'package:contacts_app/core/utils/animations/animation.dart';
import 'package:contacts_app/core/utils/color/color.dart';
import 'package:contacts_app/core/widget/image.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:lottie/lottie.dart';

class AddContactSheet extends StatefulWidget {
  const AddContactSheet({super.key});

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  File? image;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: ColorApp.darkBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Row(
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
                    children: [
                      ValueListenableBuilder(
                        valueListenable: nameCtrl,
                        builder: (context, value, child) {
                          
                          value.text.isEmpty ? 'user name' : value.text;


                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
