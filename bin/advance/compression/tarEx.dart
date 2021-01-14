import 'dart:io';

import 'package:archive/archive.dart';
import 'package:path/path.dart' as p;

void main(List<String> arguments) {

  List files = new List();
  Directory.current.listSync().forEach((FileSystemEntity fse) {
    if(fse.statSync().type == FileSystemEntityType.FILE) files.add(fse.path);
  });

  String zipFile = 'zipFileSavingLocation';

  zip(files, zipFile);

  unzip(zipFile, 'location for decompress');

}

void zip(List<String> files, String file) {
  Archive archive = new Archive();

  files.forEach((String path) {
    File file = new File(path);

    ArchiveFile archiveFile = new ArchiveFile(
        p.basename(path), file.lengthSync(), file.readAsBytesSync());
    archive.addFile(archiveFile);
  });

  ZipEncoder zipEncoder = new ZipEncoder();
  File f = new File(file);
  f.writeAsBytesSync(zipEncoder.encode(archive));

  print('Compressed!!!');
}

void unzip(String zip, String path) {
  File file = new File(zip);

  Archive archive = new ZipDecoder().decodeBytes(file.readAsBytesSync());

  archive.forEach((ArchiveFile archiveFile) {
    File file = new File(path + '/' + archiveFile.name);
    file.createSync(recursive: true); // recursive will create directory if directory not available
    file.writeAsBytesSync(archiveFile.content);
  });

  print('Decompressed!!!');
}
