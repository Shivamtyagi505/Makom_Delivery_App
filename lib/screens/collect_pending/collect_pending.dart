import 'package:flutter/material.dart';
import 'package:makom_delivery_app/screens/collect_pending/collect.dart';
import 'package:makom_delivery_app/screens/collect_pending/pending.dart';
import 'package:makom_delivery_app/widgets/index.dart';

import '../../constants.dart';

class CollectandPending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: backArrowBtn(context: context),
          title: appBarTitle(context: context, text: "Makom"),
          centerTitle: true,
          actions: [
            IconButton(icon: Icon(Icons.help_outline_sharp), onPressed: () {})
          ],
          bottom: TabBar(
            labelStyle: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                text: "Collected",
              ),
              Tab(
                text: "Pending",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CollectList(),
            PendingList(),
          ],
        ),
      ),
    );
  }
}
