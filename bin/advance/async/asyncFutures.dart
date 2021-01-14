import 'dart:io';

void main(List<String> arguments) {
  String path = Directory.current.path + "/text.txt";
  print("appending to ${path}");

  File file = new File(path);

  Future<RandomAccessFile> f = file.open(mode: FileMode.append);

  f.then((RandomAccessFile value)  {
        print('file has been opened');
        value
            .writeString('hello world this is written using async')
            .then((value) => {print("file has been appended")})
            .catchError(() => {print("an error occurred")})
            .whenComplete(() => {value.close()});
      });

  print("the end.......");
}
