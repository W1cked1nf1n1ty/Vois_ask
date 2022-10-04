import 'dart:ffi';

class UserFields {
  static String id = "id";
  static String name = "name";
  static String email = "email";
  static String MobileNo = "mobileNo";
  static String Address = "Address";
  static String age = "age";
  static String noOfDevices = "No.OfDevices";
  static String DataUsage = "DataUsage";
  static String Plan = "Plan";
  static String isrecharged = 'isrecharged';
  static List<String> getfields() => [
        id,
        name,
        email,
        MobileNo,
        Address,
        age,
        noOfDevices,
        DataUsage,
        Plan,
        isrecharged
      ];
}

class User {
  final int? id;
  final String email;
  final int mobileNo;
  final String Address;
  final int DataUsage;
  final int noOfDevices;
  final int Plan;
  final int age;
  final String name;
  final bool isrecharged;

  const User({
    this.id,
    required this.age,
    required this.mobileNo,
    required this.email,
    required this.Address,
    required this.DataUsage,
    required this.noOfDevices,
    required this.Plan,
    required this.name,
    required this.isrecharged,
  });

  User copy({
    int? id,
    String? name,
    String? email,
    bool? isrecharged,
    int? Plan,
    int? noOfDevices,
    int? DataUsage,
    int? mobileNo,
    String? Address,
    int?age

  }) =>
      User(
          Plan: Plan??this.Plan,
          DataUsage: DataUsage??this.DataUsage,
          noOfDevices: noOfDevices??this.noOfDevices,
          age:  age??this.age,
          mobileNo: mobileNo??this.mobileNo,
          id: id ?? this.id,
          email: email ?? this.email,
          name: name ?? this.name,
          isrecharged: isrecharged ?? this.isrecharged,
          Address:Address??this.Address
          );

  Map<String, dynamic> toJson() => {
        UserFields.id: id,
        UserFields.Address:Address,
        UserFields.DataUsage:DataUsage,
        UserFields.Plan:Plan,
        UserFields.age:age,
        UserFields.email: email,
        UserFields.name: name,
        UserFields.isrecharged: isrecharged,
        UserFields.MobileNo:mobileNo,
        UserFields.noOfDevices:noOfDevices,

      };
}
