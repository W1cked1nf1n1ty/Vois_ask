import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vois/model/user.dart';
import 'package:vois/widgets/button_widget.dart';

class UserForm extends StatefulWidget {
  final ValueChanged<User>onSavedUser;
  const UserForm({Key? key,required this.onSavedUser}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final formkey=GlobalKey<FormState>();
  late TextEditingController controllername;
  late TextEditingController controlleremail;
  late TextEditingController controllerAddress;
  late TextEditingController controlleraDataUsage;
  late TextEditingController controllerage;
  late TextEditingController controllerMobileNo;
  late TextEditingController controllerNoOfDevices;
  late TextEditingController controllerPlan;
  late bool isrecharged;
  @override
  void initState() {
    initUser();
    super.initState();
    
  }

  void initUser() {
    this.isrecharged = true;
    controllerAddress=TextEditingController();
    controllerMobileNo=TextEditingController();
    controlleraDataUsage=TextEditingController();
    controllerNoOfDevices=TextEditingController();
    controllerPlan=TextEditingController();
    controllerage=TextEditingController();
    controllerAddress=TextEditingController();
    controlleremail = TextEditingController();
    controllername = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          buildname(),
          SizedBox(height:12 ,),
          buildemail(),
          SizedBox(
            height: 12,
          ),
          buildMobileNo(),
          SizedBox(
            height: 12,
          ),
          buildAge(),
          SizedBox(
            height: 12,
          ),
          buildeAddress(),
          SizedBox(
            height: 12,
          ),
          buildDataUsage(),
          SizedBox(
            height: 12,
          ),
          buildPlan(),
          SizedBox(
            height: 12,
          ),buildNoOfDevices(),
          SizedBox(
            height: 12,
          ),
          buildisrecharged(),
          buildSave(),
        ],
      ),
    );
  }

  Widget buildname() => TextFormField(
        validator: (value){
          value!=null && value.isEmpty?"Enter name":null;
        },
        controller: controllername,
        decoration: InputDecoration(
          labelText: "Name",
          border: OutlineInputBorder(),
        ),
      );

  Widget buildemail() => TextFormField(
        validator: (value){
          value!=null&& !value.contains('@')?'Enter Email':null;
        },
        controller: controlleremail,
        decoration:InputDecoration(labelText: "Email", border: OutlineInputBorder()),
      );

  Widget buildAge()=>TextFormField(
    keyboardType: TextInputType.phone,
    controller: controllerage,
    decoration:InputDecoration(labelText: "Age", border: OutlineInputBorder()) ,
  );

  Widget buildDataUsage()=>TextFormField(
    keyboardType:TextInputType.number,
    controller: controlleraDataUsage,
    decoration:InputDecoration(labelText: "Data Usage", border: OutlineInputBorder())
  );

  Widget buildeAddress()=>TextFormField(
    keyboardType: TextInputType.streetAddress,
    controller: controllerAddress,
    decoration:InputDecoration(labelText: "Address", border: OutlineInputBorder())
  );

  Widget buildPlan()=>TextFormField(
    keyboardType: TextInputType.number,
    controller: controllerPlan,
    decoration:InputDecoration(labelText: "Plan", border: OutlineInputBorder())
  );

  Widget buildMobileNo()=>TextFormField(
    keyboardType: TextInputType.number,
    controller: controllerMobileNo,
    decoration:InputDecoration(labelText: "Mobile No", border: OutlineInputBorder())
  );
  
  Widget buildNoOfDevices()=>TextFormField(
    keyboardType: TextInputType.number,
    controller: controllerNoOfDevices,
    decoration:InputDecoration(labelText: "No. Of Devices", border: OutlineInputBorder())
  );

  Widget buildisrecharged() => SwitchListTile(
      value: isrecharged,
      title: Text("Is Recharged ?"),
      onChanged: (value) {setState(() {
        isrecharged=value;
      });}
      );
  Widget buildSave() => Buttonwidget(
    text: "Save",
    onClicked: () {
      final form=formkey.currentState!;
      final isvalid=form.validate();
      if(isvalid){
        final user=User(
          DataUsage: int.parse(controlleraDataUsage.text),
          Plan: int.parse(controllerPlan.text),
          mobileNo: int.parse(controllerMobileNo.text),
          email:controlleremail.text,
          name: controllername.text,
          isrecharged: isrecharged,
          noOfDevices: int.parse(controllerNoOfDevices.text),
          age: int.parse(controllerage.text),
          Address:controllerAddress.text);
        widget.onSavedUser(user);
      }
    });
}
