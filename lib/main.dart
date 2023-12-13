import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'contacts_page.dart';
import 'controler/hive_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  Hive.registerAdapter(contectdataAdapter());
  Hive.openBox("contect");
  runApp(MaterialApp(theme: ThemeData.dark(),debugShowCheckedModeBanner: false,home: ContactsScreen(),));
}
