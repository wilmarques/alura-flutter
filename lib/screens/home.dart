import 'package:flutter/material.dart';

import '../components/sections/actions.dart';
import '../components/sections/header.dart';
import '../components/sections/points_exchange.dart';
import '../components/sections/recent_activities.dart';
import '../data/bank_http.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Header(), // cuidado com o const
            RecentActivity(),
            ActionsSection(),
            PointsExchange(),
          ],
        ),
      ),
    );
  }
}
