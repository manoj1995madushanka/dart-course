import 'dart:io';

void main(List<String> arguments)
{
  // printSystemTemporyDirectory();
  //getFileDetails();
  writeAndRead();
}

void printSystemTemporyDirectory()
{
  Directory dir = Directory.systemTemp.createTempSync();
  print(dir.path);

  if(dir.existsSync())
    {
      print("removing ${dir.path}");
      dir.deleteSync();
    }
  else{
    print("path can not be found");
  }
}

void getFileDetails()
{
  Directory dir = Directory.current;
  print(dir.path);

  List<FileSystemEntity> list = dir.listSync(recursive: false);
  print("entries in the list : ${list.length}");

  list.forEach((FileSystemEntity element) {
    FileStat fileStat = element.statSync();

    print("type : ${fileStat.type}");
  });

}

void writeAndRead()
{
  Directory dir = Directory.current;
  print(dir.path);

  File file = new File(dir.path + '/myText.txt');

  createFile(file);

  readFile(file);
}

void createFile(File file)
{
  RandomAccessFile raf = file.openSync(mode:FileMode.append);
  raf.writeStringSync("Hello world\r\nHow are you today?");
  raf.flushSync();
  raf.closeSync();
}

void readFile(File file)
{
  if(!file.existsSync())
    {
      print("file not found");
      return;
    }
  
  print("reading string");
  print(file.readAsStringSync());

  print("reading bytes...");
  print(file.readAsBytesSync());

  print("reading lines...");
  print(file.readAsLinesSync());
}