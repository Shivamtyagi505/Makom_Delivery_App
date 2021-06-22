import 'package:flutter/material.dart';
import 'package:makom_delivery_app/widgets/pick_drop_card.dart';

class PendingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return PickAndDropCard();
        },
      ),
    );
  }
}
