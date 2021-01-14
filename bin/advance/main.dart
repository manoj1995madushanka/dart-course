import 'dart:io';

void main(List<String> arguments)
{
  getOSVersions();
}

void getOSVersions()
{
  print("OS : ${Platform.operatingSystem} , version ${Platform.version}");

  if(Platform.isWindows)
    {
      print("powered by windows");
    }
  
  print(Platform.script.path);
  print(Platform.executable);

  print("Env. variables");
  Platform.environment.keys.forEach((element) {
    print("${element} : ${Platform.environment[element]}");
  });
}

