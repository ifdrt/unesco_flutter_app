import 'package:path_provider/path_provider.dart';

import 'dart:io';

import 'package:http/http.dart' as http;

class SaveFile {

 

 Future<String> saveImage(String url,String name) async {
  



  
    var response = await http.get(Uri(host: url));

 
    var documentDirectory = await getApplicationDocumentsDirectory();
     
    var firstPath = documentDirectory.path + "/pharmacy";
    var filePathAndName = documentDirectory.path + '/pharmacy/'+name+'.jpg'; 
    //comment out the next three lines to 'prove' the next time that you run
    // the code to prove that it was downloaded and saved to your device
    await Directory(firstPath).create(recursive: true);
   
    File file2 = new File(filePathAndName);
   
    file2.writeAsBytesSync(response.bodyBytes);

 return file2.path;
    
  }
 



  
saveFile(String jsondata) async {
  



 
    var documentDirectory = await getApplicationDocumentsDirectory();
     
    var firstPath = documentDirectory.path + "/hejozat";
    var filePathAndName = documentDirectory.path + '/hejozat/jsonApi.json'; 
    //comment out the next three lines to 'prove' the next time that you run
    // the code to prove that it was downloaded and saved to your device
    await Directory(firstPath).create(recursive: true);
   
    File file2 = new File(filePathAndName);
   
    file2.writeAsString(jsondata);
// prefs.setString("jsonPath", "jsonApi");

    
  }
 
   
}