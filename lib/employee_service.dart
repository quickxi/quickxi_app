// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class EmployeeService {
//   static const baseUrl = 'http://localhost:8080/api/employees';

//   static Future<List<Employee>> getAllEmployees() async {
//     final response = await http.get(Uri.parse(baseUrl));
//     if (response.statusCode == 200) {
//       Iterable jsonResponse = json.decode(response.body);
//       return jsonResponse.map((model) => Employee.fromJson(model)).toList();
//     } else {
//       throw Exception('Failed to load employees');
//     }
//   }

//   static Future<Employee> createEmployee(Employee employee) async {
//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(employee.toJson()),
//     );
//     if (response.statusCode == 200) {
//       return Employee.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to create employee');
//     }
//   }
// }

// class Employee {
//   final int id;
//   final String firstName;
//   final String lastName;

//   Employee({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//   });

//   factory Employee.fromJson(Map<String, dynamic> json) {
//     return Employee(
//       id: json['id'],
//       firstName: json['firstName'],
//       lastName: json['lastName'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'firstName': firstName,
//       'lastName': lastName,
//     };
//   }
// }
