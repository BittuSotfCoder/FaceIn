import 'package:galileo_sqljocky5/public/connection/connection.dart';
import 'package:galileo_sqljocky5/public/results/results.dart';

Future<MySqlConnection> connectToMySQL() async {
  var pool = new ConnectionSettings(
    host: '127.0.0.1',
    port: 3306,
    user: 'root',
    password: '',
    db: 'book',
  );

  var conn = await MySqlConnection.connect(pool);
  return conn;
}


void Execu() async {
  var conn = await connectToMySQL();

  print(conn);

  // Example query
  Results results = (await conn.execute('select name, email from tab')) as Results;

  // Process results
  results.forEach((row) {
    print('Column 1: ${row[0]}, Column 2: ${row[1]}');
  });

  // Close the connection
  await conn.close();
}
