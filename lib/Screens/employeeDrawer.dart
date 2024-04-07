import 'package:flutter/material.dart';
import 'package:quickxi_app/Screens/getEmployee.dart';
import 'package:quickxi_app/Screens/registerEmployee.dart';

class employeeDrawer extends StatefulWidget {
  const employeeDrawer({super.key});

  @override
  State<StatefulWidget> createState() {
    return employeeDrawerState();
  }
}

class employeeDrawerState extends State<employeeDrawer>{
  final minimumPadding = 2.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employenagement'),
      ),
      body: Center(child: Text('Welocme to PxP Channel')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
            children: <Widget>[
              DrawerHeader(
                child: Text('Employee Management'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
        ),
                ListTile(
                  title: Text('Register Employee'),
                  onTap: (){ // 클릭하면 뭔가 이루어지는 동작 부분인것 같음?
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=>registerEmployee()));
                  },
                ),  ListTile(
                  title: Text('Get Employee'),
                  onTap: (){ // 클릭하면 뭔가 이루어지는 동작 부분인것 같음?
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>getemployees()));
                  },
                ),
            ],
          ),
        ),
      );
  }

}