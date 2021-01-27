import 'dart:io';

import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/constants.dart';
import 'dart:async';

void main(List<String> arguments) async
{
  var pool = new ConnectionPool(
      host: 'localhost',
      port: 3306,
      user: 'manoj',
      password: 'admin',
      db: 'school',
      max: 5);

  var query = await pool.prepare('insert into teachers (name,topic) values (?,?)');

  await insert(query,'Manoj','Maths');

}

void insert(var query, String name, String topic) async
{
  var result = query.execute([name,topic]);
  print('new user id : ${result.insertId}');
}

