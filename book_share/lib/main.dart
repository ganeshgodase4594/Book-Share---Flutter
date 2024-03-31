import 'package:book_share/addbookdata.dart';
import 'package:book_share/database.dart';
import 'package:book_share/firstscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

dynamic database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = openDatabase(
    join(await getDatabasesPath(), "bookDBv10.db"),
    version: 1,
    onCreate: (db, version) {
      db.execute('''CREATE TABLE bookinfo (
      bookid INTEGER PRIMARY KEY,
      booktitle TEXT,
      bookdesc TEXT,
      authorname TEXT,
      rating REAL,
      bookimg TEXT,
      authordesc TEXT,
      aboutbook TEXT,
      bookPrice INTEGER,
      bookCount INTEGER,
      bookReviews REAL);'''
    );
    },
  );

  runApp(const MyApp());
  Book.insertBookData(book1);
  Book.insertBookData(book2);
  Book.insertBookData(book3);
  Book.insertBookData(book4);
  Book.insertBookData(book5);
  Book.insertBookData(book6);
  Book.insertBookData(book7);

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    );
  }
}
