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

  var results = await pool.query('select Name,Topic from Teachers');

  await results.forEach( (row) {
    print('Name : ${row[0]} , Topic : ${row.Topic}');

  });

  pool.closeConnectionsNow();
  exit(0);


}