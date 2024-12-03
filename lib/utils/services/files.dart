import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:networks_app/utils/device/device_utility.dart';

class TFileServices{
  TFileServices._();

  static String fileName = "";
  static bool isFilePicked=false;
  static Uint8List fileBytes=Uint8List(8);
  static String path="";

  static Future<void> pickFile() async {
    FilePickerResult? pickedFile=await FilePicker.platform.pickFiles();

    if (pickedFile != null) {
      if(!TDeviceUtils.isWeb()){
        File file=File(pickedFile.files.single.path.toString());
        fileBytes=file.readAsBytesSync();
        String name=file.path.split('/').last;
        path=file.path.toString();

        print('Name: $name\nSize: ${fileBytes.length}');
        // هون منرفرش
        fileName=name;
        isFilePicked=true;
      }else{
        PlatformFile file = pickedFile.files.first;
        fileBytes=file.bytes!;
        print('Name: ${file.name}\nSize: ${file.size}');
        // هون منرفرش
        fileName=file.name;
        isFilePicked=true;
      }
    } else {
      print("Unable to pick files");
    }
  }
}