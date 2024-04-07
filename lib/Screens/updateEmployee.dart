import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quickxi_app/Screens/employeeDrawer.dart';

import '../Model/EmployeeModel.dart';
import 'package:http/http.dart' as http;

import 'registerEmployee.dart';

class updateEmployee extends StatefulWidget {
  // const updateEmployee({super.key});
  EmployeeModel employee;

  @override
  State<StatefulWidget> createState() {
    return updateEmployeeState(employee);
  }
  updateEmployee(this.employee);
}

Future<EmployeeModel?> updateEmployees(
    EmployeeModel employee, BuildContext context) async {
  var Url = "http://localhost:8080/updateemployee";
  var response = await http.put(Url as Uri,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(employee));
  String responseString = response.body;
  if (response.statusCode == 200) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return MyAlertDialog(
              title: 'Backend Response', content: response.body);
        });
  }
}

class updateEmployeeState extends State<updateEmployee> {
  late EmployeeModel employee;
  final minimumPadding = 5.0;
  late TextEditingController employeeNumber;
  bool _isEnabled = false;
  late TextEditingController firstController;
  late TextEditingController lastController;
  late Future<List<EmployeeModel>> employees;

  updateEmployeeState(this.employee) {
    employeeNumber = TextEditingController(text: employee.id.toString());
    firstController = TextEditingController(text: employee.firstName);
    lastController = TextEditingController(text: employee.lastName);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleSmall;
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Employee'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => employeeDrawer()));
          },
          ),
        ),
        body: Container(
        child: Padding(
          padding: EdgeInsets.all(minimumPadding*2),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
                child: TextFormField(
                  style: textStyle,
                  controller: employeeNumber,
                  enabled:_isEnabled,
                  validator: (String? value){
                      if(value == null || value.isEmpty){
                        return 'Please enter your ID';
                      }
                  },
                  decoration: InputDecoration(
                    labelText: 'Employee ID',
                    hintText: 'Enter Employee ID',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
                child: TextFormField(
                  style: textStyle,
                  controller: lastController,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'please enter your name';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'Enter Your First Name',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
                )),
              ElevatedButton(child: Text('Update Details'
                ),
                onPressed: ()async{
                  String firstName = firstController.text;
                  String lastName = lastController.text;
                  EmployeeModel emp = new EmployeeModel();
                  emp.id = employee.id;
                  emp.firstName = firstController.text;
                  emp.lastName = lastController.text;
                  EmployeeModel? employees = await updateEmployees(emp,context);
                  setState((){
                    employee = employees!;
                  });
                },
                )
            ]
        )
        )
      )
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    required this.title,
    required this.content,
    this.actions = const[],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.bodySmall)
    );
  }
}