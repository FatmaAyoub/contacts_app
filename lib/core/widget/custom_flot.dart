import 'package:flutter/material.dart';
import 'package:contacts_app/core/utils/color/color.dart';

class CustomFloat extends StatelessWidget {
  const CustomFloat({
    super.key,
    required this.showAddContact,
    required this.deleteContact,
    required this.isAdd,
    required this.isDelete
  });

  final Function showAddContact;
  final Function deleteContact;
  final isAdd;
  final isDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
  

        Visibility(
        visible: isAdd,
          child: FloatingActionButton(
            backgroundColor: ColorApp.white,
            tooltip: 'Add',
            onPressed: () {
              // Handle the first button press
              showAddContact();
            },
            child: const Icon(Icons.add, color: ColorApp.darkBlue, size: 30),
          ),
        ),
              Visibility(
         visible: isDelete,
          child: FloatingActionButton(
            backgroundColor: ColorApp.red,
            tooltip: 'Delete',
            onPressed: () {
              deleteContact();
            },
            child: const Icon(Icons.delete, color: ColorApp.white, size: 30),
          ),
        ),
      ],
    );
  }
}
