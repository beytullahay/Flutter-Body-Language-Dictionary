import 'package:beden_dili_sozlugu/pages/mean_list_page.dart';
import 'package:beden_dili_sozlugu/viewmodels/meaning_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => MeaningListViewModel(),
        child: const MeanListPage(),
      ),
    );
  }
}
