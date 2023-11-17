import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase{
  final int version = 1;
  final String databaseName='meals.db';
  final String tableName='meals';
  //final String tableName='category';
  //final String tableName = 'mealsDetails';

  Database? _db;//lo hacemos privado por que no se debe acceder desde fuera de la base de datos

  Future<Database> openDB() async{
    _db??=await openDatabase(
        join(await getDatabasesPath(),databaseName),
        onCreate: (database,version){
          database.execute('create table $tableName (id text primary key, name text, imageUrl text)');
        },
        version: version
    );
    return _db as Database;
  }
}