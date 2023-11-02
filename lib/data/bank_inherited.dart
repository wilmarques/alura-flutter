import 'package:flutter/material.dart';

import '../models/bank.dart';

class BankInherited extends InheritedWidget {
  BankInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final BankModel values = BankModel();

  static BankInherited of(BuildContext context) {
    final BankInherited? result =
        context.dependOnInheritedWidgetOfExactType<BankInherited>();
    assert(result != null, 'No BankInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(BankInherited oldWidget) {
    print('updateShouldNotify: ${oldWidget.values.points}');
    return values.points != oldWidget.values.points;
  }
}
