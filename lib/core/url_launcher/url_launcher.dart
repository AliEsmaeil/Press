import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

final class URLLauncher{
  static Future<bool> launchFile({required String filePath})async{

   try{
     if((await Permission.storage.request()).isGranted){
       if(! File(filePath).existsSync()){
         print('will return false');
         return false;
       }

       var fileUri = Uri.file(filePath);
       if(await canLaunchUrl(fileUri)){
         launchUrl(fileUri, mode: LaunchMode.externalNonBrowserApplication);
         print('will return true');
         return true;
       }
       print('will return false');
       return false;
     }
     else{
       print('permission denied');
       return false;
     }
   }
   catch(e,s){
     print('will return false');
     print('EXCEPTION IN EXCEL OPNENNING : $e, $s');
     return false;
   }
   }

}