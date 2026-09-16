import 'package:contacts_app/core/utils/color/color.dart';
import 'package:contacts_app/core/utils/style/app_style.dart';
import 'package:contacts_app/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:contacts_app/core/utils/animations/animation.dart';
import 'package:lottie/lottie.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.contactModel,
    required this.deleteContact,
  });
  final Contact contactModel;
  final Function deleteContact;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.only(bottom: 16),
      decoration: BoxDecoration(
        color: ColorApp.gold,
        borderRadius: BorderRadius.circular(16),
      ), // BoxDecoration
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                contactModel.image == null
                    ? Lottie.asset(AnimationApp.imagePicker)
                    : ClipRRect(
                        child: Image.file(
                          contactModel.image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                Container(
                  margin: EdgeInsetsGeometry.all(8),
                  padding: EdgeInsetsGeometry.all(8),
                  decoration: BoxDecoration(
                    color: ColorApp.gold,
                    borderRadius: BorderRadius.circular(8),
                  ), // BoxDecoration
                  child: Text(
                    contactModel.name,
                    style: AppStyles.cardUserNameTextStyle,
                  ), // Text
                ), // Container
              ],
            ),
          ),

          // Stack
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.email, color: ColorApp.darkBlue, size: 25),
                    Expanded(
                      child: Text(
                        contactModel.email,
                        style: AppStyles.cardContentTextStyle,
                      ),
                    ),
                  ],
                ),

                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.phone, color: ColorApp.darkBlue, size: 25),
                    Expanded(
                      child: Text(
                        contactModel.phoneNumber,
                        style: AppStyles.cardContentTextStyle,
                      ),
                    ),
                  ],
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorApp.red,
                  ), // styleFrom
                  onPressed: () {
                    deleteContact();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete, color: Colors.white, size: 18),
                      Text(
                        "Delete",
                        style: AppStyles.cardContentTextStyle.copyWith(
                          color: Colors.white,
                        ),
                      ), // Text
                    ],
                  ), // Row
                ), // Elev
              ],
            ),
          ),
        ],
      ),
    );
  }
}
