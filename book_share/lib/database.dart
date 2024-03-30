
import 'package:book_share/main.dart';
import 'package:sqflite/sqflite.dart';

class Book{

  int bookid;
  String booktitle;
  String bookdesc;
  double rating;
  String authorname;
  String authordesc;
  String aboutbook;
  String bookimg;

  Book({required this.bookid,
  required this.booktitle,
  required this.bookdesc,
  required this.rating,
  required this.authorname,
  required this.authordesc,
  required this.aboutbook,
  required this.bookimg
  });

  Map<String,dynamic> BookdataMap(){
      return {
        'bookid':bookid,
        'booktitle':booktitle,
        'bookdesc':bookdesc,
        'rating':rating,
        'authorname':authorname,
        'authordesc':authordesc,
        'aboutbook':aboutbook,
        'bookimg':bookimg,
      };
  }

static Future<void> insertBookData(Book book) async{

    final localDB = await database;

    localDB.insert("bookinfo",book.BookdataMap(),
    conflictAlgorithm: ConflictAlgorithm.replace);


  }

  static Future<List<Book>> getBookData() async{

    final localDB = await database;

    List<Book>obj = [];

    List<Map<String,dynamic>> returnbookdata = await localDB.query('bookinfo');

    for(int i=0;i<returnbookdata.length;i++){
        obj.add(Book(bookid: returnbookdata[i]['bookid'], booktitle: returnbookdata[i]['booktitle'], bookdesc: returnbookdata[i]['bookdesc'], rating: returnbookdata[i]['rating'], authorname: returnbookdata[i]['authorname'], authordesc: returnbookdata[i]['authordesc'], aboutbook: returnbookdata[i]['aboutbook'], bookimg: returnbookdata[i]['bookimg']));
    }

    return obj;
  }
}