import 'package:dogs_images_api_consumer/constantes.dart';
import 'package:dogs_images_api_consumer/ui/widgets/item_description_with_divider.dart';
import 'package:flutter/material.dart';

class CardItemsDescription extends StatelessWidget {
  const CardItemsDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 15)],
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xff121212)),
      child: const Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemDescriptionWithDivider(
              title: 'BIO',
              description:
                  Constantes.studentBio,
            ),
            ItemDescriptionWithDivider(
              title: 'STUDENT ID',
              description: Constantes.studentId,
              paddingTop: 10,
            ),
            ItemDescriptionWithDivider(
              title: 'EMAIL',
              description: Constantes.studentEmail,
              paddingTop: 10,
            ),
            ItemDescriptionWithDivider(
              title: 'PHONE',
              description: Constantes.studentPhone,
              paddingTop: 10,
            ),
          ],
        ),
      ),
    );
  }
}