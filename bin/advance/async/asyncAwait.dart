import 'dart:io';

// this will wait until async task completed
void main(List<String> arguments) async {
  print("starting");

  File file = await appendFile();

  print("appended to file + ${file.path}");

  print("starting reading");
  print( await readFile());

  print("end.........");
}

Future<File> appendFile()
{
  File file = new File(Directory.current.path + "/text1.txt");
  DateTime now  = new DateTime.now();
  return file.writeAsString(now.toString() + '\r\n', mode: FileMode.append);
}

Future<String> readFile()
{
  File file = new File(Directory.current.path + "/text1.txt");
  return file.readAsString();
}