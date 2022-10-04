import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:vois/model/user.dart';

class UserSheetapi{
  static const credential=r'''
{
  "type": "service_account",
  "project_id": "vois-363508",
  "private_key_id": "fd4badf25c6e8defde5a6cd4b6a5e850c9cca236",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQD2VLao3gcpSMI4\nmp/FY6J509R79fAgNRtYVTYRKvIoPG1vrpRZxmpMcFQNI/GHbNnwbUhVOdmBPBAD\nvtnkYa5tt8/I/SkhahQBoNjH5Ov+vko7H7pLfomnvfOiZdIZgadgfxKGWs/v15iH\nHN/wXpmMD4P6/8Hc8oRbHH2HxkjTke7MkFnzH+116/ems6XuMlGFwpK76PIEA01J\nTV0cirxWzWhskbvQwwHjLa2V3N98BUlDVzNA+Q2y8WXt7jMzGY5C7WRLquYMtEEH\nU14I3P5WXPkdZ3zlsCQuLPhKGoOgNYYjqu1wYr3/1Yah6d3uxVxrN2Nq9FwPjMAQ\nPHaAB5qxAgMBAAECggEAAUrXfHz8YkyQlvXEtyc7Kn112hf5Dwoy9FyEwJlOP5og\nOYZGc/l1BE/7OOhtM3iFj4aF6yCMZ2pWa9ab/l/pfNzf2Qju/CRk1M9bDngWfuB7\ns4y1OwEqcrgDPQu2Cvk2/2wbP5uJXL5E/Wx626AmGRSEbOmGQwT+CcZVUu7eN0dE\nQWScnJ2OT5VUXtZo9kiYAoPDwIooXVVy92J2MBB/9cdtequY1ZsJQN8gnkWB1Lyx\nvXlsFKMAYP6ed4LMildY8NRY1xyzIOunPxIuPeTrdf8DB4NHEOGu59YFGx0vfiIv\nDll8V0/d7/i9GQ8ZGW/Uj/ART7c/23gY1gAqTpuu2wKBgQD82x/vY0b4+bDYPNm0\nxN1j74hm3dOaF6KA4hK1Xo3kEXapwwBIEXvmw4Z7EZokSkqsu5TdO9ZoBHbcG09U\nDR8LuyXFmGcEss/BemNBDCVfYkmYR49cZsLiQJFLsVg7yIiSvwROmPpTQtkmTy10\nz8BKINdVkjf9ifotIF5/EhLuxwKBgQD5ZNGTd4ZdfJ9sOb5LetFr1LBbCzIUbJQy\nZ+c2TatsOmDaIz6uCxHaC2QSVAUbDxa0OvMv4VYCYWttjqs+GQhSf98x5xr/ybyq\nMejOoUQTadvENsdwqgyQF1uvuS2KPetZ/d9P8i5H3V3cMVVr00Cix/uaWtyz25oK\nXTDBH0oSxwKBgFU+Uj/UCkM5ekMMEKD+lVxxjlyPgBy8xw4IKSJ35AH1WTnWAaxK\nKKkdVaL7xilh2lbtTjxfReL/TkrZ8h515feAejVpMaHF3oBtkDSHsbm8Wu85gL03\n749zEQihmwtciZ5fQ0Z0EEAtkyN1Ie/1cfALrkys5K9W6r534SOZpkRVAoGAMgp2\nut46ybtdybt0YXTNXJOap0oBzHNU8SBEFnNTOC4mjN6Rjx6NgHDUrZDKTXmjlppV\nfX/7YBLoGV2NIrKnJtadlEfI9RYnkwbcrclR/Ys6G47aSdL1Hlxxezru1lRCSxZT\nnpj7jFPwp2QGvdHvoDn8VCZzLmub5wR36eg7VrUCgYAlda5RQEk2uiKZSM5oD6C2\nGgN3JPPkWV4pglaYGkCnQhp1M5nHVi/uTBJd0AZmvMtvNi+IOQLsjbRgy1KWBMEE\nBHZunKJP4ILmYX2XSZqZTrlPMMr2MoPmc9enatveof9EkWWIEDq64CZUlZDIosre\nr3H7eRDQPI/I8+8WQYSXLg==\n-----END PRIVATE KEY-----\n",
  "client_email": "vois-418@vois-363508.iam.gserviceaccount.com",
  "client_id": "116176446954000091004",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/vois-418%40vois-363508.iam.gserviceaccount.com"
}
''';
  static final spreadsheetid='1AP_5XMPLBqFueDtewiq-NsVwoDpMqHR_Sjh-7UKKUVM';
  static final gsheets=GSheets(credential);
  static Worksheet? usersheet;
  static Future init()async{
    try{
    final spreadsheet=await gsheets.spreadsheet(spreadsheetid);
    usersheet=await getWorkSheet(spreadsheet,title:'Users');
    final firstrow=UserFields.getfields();
    usersheet!.values.insertRow(1,firstrow);
    
    }catch(e){
      print("Init error: $e");
      return Center(child: CircularProgressIndicator());
    }
  }
  static Future<Worksheet>getWorkSheet(
    Spreadsheet spreadsheet,{
      required String title,
    })async{
      try{
        return await spreadsheet.addWorksheet(title);
      }catch(e){
        return await spreadsheet.worksheetByTitle(title)!;
      }
    } 
  
  static Future<int>getrowcount()async{
    if(usersheet==null)return 0;
    final lastrow=await usersheet!.values.lastRow();
    return lastrow==null?0:int.tryParse(lastrow.first)??0;
  }
  static Future insert(List<Map<String,dynamic>>rowlist)async{
    if(usersheet==null)return;
    usersheet!.values.map.appendRows(rowlist);
  }
}