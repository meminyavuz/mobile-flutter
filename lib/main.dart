import 'package:flutter/material.dart';
import 'package:untitled/Pages/Employees_Page.dart';
import 'package:untitled/Pages/Managers_Page.dart';
import 'package:untitled/Pages/Messages.dart';
import 'package:untitled/Repository/Employees_Repository.dart';
import 'package:untitled/Repository/Managers_Repository.dart';
import 'package:untitled/Repository/Messages_Repository.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: const MyHomePage(title: 'DigiNova App Home Page')
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MessageRepository messageRepository = MessageRepository();
  EmployeeRepository employeeRepository = EmployeeRepository();
  ManagerRepository managerRepository = ManagerRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body:Stack(
        children: [
          Positioned.fill(
            child: Image.network('https://media.licdn.com/dms/image/C4D0BAQE9tzqrAoU5oA/company-logo_200_200/0/1630465534843?e=2147483647&v=beta&t=bsQsKs0GYfDuHeVRboLb3ug_81qGnk1iRjcdYFpxujQ', // Arka plan resminin dosya yolu
              fit: BoxFit.none,
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ManagerPage(managerRepository)));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade300),
                    child: Text('Go Managers Page (${managerRepository.managers.length} Manager)')
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmployeePage(employeeRepository)));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade300),
                    child: Text('Go Employees Page (${employeeRepository.employees.length} Employee)')
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Messages(messageRepository)))
                          .then((result) {
                        setState(() {
                        });
                      });
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade300),
                    child: Text('Go Messages Page (${messageRepository.newMessageCount} New Messages)')
                )
              ],
            ),
          ),
        ],
      )

    );
  }
}

