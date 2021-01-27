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

  var results = await pool.query('select * from teachers');
  print('Results ${await results.length} rows');

  pool.closeConnectionsNow();
  exit(0);
}
