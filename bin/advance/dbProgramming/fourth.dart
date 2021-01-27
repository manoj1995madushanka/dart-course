import 'dart:io';

import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/constants.dart';
import 'dart:async';

void main(List<String> arguments) async {
  var pool = new ConnectionPool(
      host: 'localhost',
      port: 3306,
      user: 'manoj',
      password: 'admin',
      db: 'school',
      max: 5);

  var trans = pool.startTransaction();

  try {
    int id = insert(pool, 'name', 'topic') as int;
    int person = find(pool, 'name') as int;
    await delete(pool, person);

    await trans.commit();
    print('done');
  } catch (err) {
    print(err.toString());
    await trans.rollback();
  } finally {
    await pool.closeConnectionsNow();
    exit(0);
  }
}

Future<int> find(var pool, String name) async {
  Query query = await pool.prepare('select id from Teachers where name =?');
  Results results = await query.execute(name);
  Row row = await results.first;
  return row[0];
}

Future<int> insert(var pool, String name, String topic) async {
  Query query =
      await pool.prepare('insert into teachers (name,topic) values (?,?)');
  Results results = await query.execute(name, topic);
  return results.insertId;
}

Future delete(var pool, int value) async {
  Query query = await pool.prepare('delete from teachers where id = ?');
  Results results = await query.execute(value);
}
