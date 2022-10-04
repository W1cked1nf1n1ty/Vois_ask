import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vois/api/sheets/UserSheetsapi.dart';
import 'package:vois/model/user.dart';
import 'package:vois/widgets/button_widget.dart';
import 'package:vois/widgets/userform_widget.dart';

class CreateSheetPage extends StatelessWidget {
  const CreateSheetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        
      ),
      appBar:AppBar(
        title: Text("A.S.K"),),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(16),
            child: UserForm(onSavedUser: (user)async{
              final id=await UserSheetapi.getrowcount()+1;
              final newuser=user.copy(id:id);
              await UserSheetapi.insert([newuser.toJson()]);
            })
            
            ),
        ),
        );
  }
}