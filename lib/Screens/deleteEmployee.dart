import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quickxi_app/Screens/getEmployee.dart';

import '../Model/EmployeeModel.dart';

import 'package:http/http.dart' as http;

class deleteEmployee extends StatefulWidget {
  const deleteEmployee({super.key});

  @override
  State<StatefulWidget> createState() { 
    return deleteEmployeeState();
  }
}

Future <EmployeeModel> deleteEmployees(String firstName, String lastName) async {
  var Url = "http://localhost:8080/deleteemployee";
  var response = await http.delete(
    Url as Uri,
    headers:<String, String >{
      "Content-Type": "applicaiton/json;charset=UTF-8,"
    }
  );
  return EmployeeModel.fromJson(jsonDecode(response.body));
}

class deleteEmployeeState extends State<deleteEmployee> {
  @override
  Widget build(BuildContext context) {
    return getemployees();
  }
}