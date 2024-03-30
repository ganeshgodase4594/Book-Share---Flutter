import 'package:book_share/addbookdata.dart';
import 'package:book_share/database.dart';
import 'package:book_share/firstscreen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

dynamic database;

void main() async{
  runApp(const MyApp());

  database=openDatabase(
    join(await getDatabasesPath(),"bookDB.db"),
    version: 1,
    onCreate: (db, version) {
      db.execute(
        '''create table bookinfo(
          bookid int primary key,
          booktitle text,
          bookdesc text,
          authorname text,
          authordesc text,
          aboutbook text
          '''
        );
    },
  );
  Book.insertBookData(book1);
  Book.insertBookData(book2);
  Book.insertBookData(book3);
  Book.insertBookData(book4);
  Book.insertBookData(book5);
  Book.insertBookData(book6);
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    );
  }
}
