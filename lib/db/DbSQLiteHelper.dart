import 'package:contact_app/models/contact_model.dart';
import 'package:path/path.dart' as Path;
import 'package:sqflite/sqflite.dart';

class DbSQLiteHelper{

  static final String create_table_contact = '''create table $table_connect(
  $table_connect_col_id integer primary key autoincrement,
  $table_connect_col_name text not null,
  $table_connect_col_phone text not null,
  $table_connect_col_email text not null,
  $table_connect_col_address text not null,
  $table_connect_col_favorite integer not null)''';

  static Future<Database> open() async{
    //Future<String> rootPath = getDatabasesPath();
    final rootPath = await getDatabasesPath();
    final dbPath = Path.join(rootPath, 'contact.db');

    return await openDatabase(dbPath, version: 1, onCreate:(db, version) async{
      await db.execute(create_table_contact);
    });
  }

  static Future<int> addContact(Contact contact) async{
    final db = await open();
    return db.insert(table_connect, contact.toMap());
  }

  static Future<List<Contact>> getAllContact() async{
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(table_connect);
    return List.generate(mapList.length, (index) => Contact.fromMap(mapList[index]));
    //final contactList = <Contact>[];
    //return <Contact>[
    //  Contact(name: 'abc', phone: '123456', email: 'teshchd', address: 'sssfsdfdsf'),
    //  Contact(name: 'def', phone: '12423423456', email: 'teshchd', address: 'sssfsdfdsf'),
    //];
  }
}