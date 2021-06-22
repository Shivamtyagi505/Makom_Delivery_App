import 'package:flutter/material.dart';
import 'package:makom_delivery_app/widgets/pick_drop_card.dart';

class PickUpList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return PickAndDropCard();
        },
      ),
    );
  }
}
